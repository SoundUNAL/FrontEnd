import 'package:flutter/material.dart';
import '../models/songs_model.dart';
import '../blocs/search_song_bloc.dart';
import '../ui/nav.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sound_frontend/src/ui/login/login_screen.dart';
import 'package:sound_frontend/src/ui/music_player/music_player.dart';

const storage = FlutterSecureStorage();

class SearchedSongs extends StatelessWidget {
  final String searchText;

  const SearchedSongs({Key? key, required this.searchText}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    bloc.fetchSearchSongs(searchText);
    return Column(
      children: [
        Container(
          height: 80,
          child: NavBar(
            title: const Text("SoUNd", style: TextStyle(fontSize: 25, color: Colors.white,
                  decoration: TextDecoration.none,
                )),
          ),
        ),
        Expanded(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 2, 2, 2),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 2, 2, 2),
              title: Text('Resultados para "$searchText"'),
            ),
            body: StreamBuilder(
                stream: bloc.allSongs,
                builder: (context, AsyncSnapshot<SongModel> snapshot) {
                  if (snapshot.hasData && snapshot.data!.songs.isNotEmpty) {
                    return buildGrid(snapshot, context);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    // Mostrar texto cuando no hay canciones disponibles
                    return const Center(
                      child: Text(
                        'No se encontraron canciones',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
              )

          ),
        ),
      ],
    );
  }

  Widget buildGrid(AsyncSnapshot<SongModel> snapshot, BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1,
      ),
      itemCount: snapshot.data?.songs.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final song = snapshot.data?.songs[index];
        String imageUrl = song?.imageUrl ?? '';
        imageUrl = imageUrl.replaceAll('host.docker.internal', 'localhost');
        return GestureDetector(
          onTap: () async {
            bool isAuthenticated = await _checkCookieExistence();
            if (isAuthenticated) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MusicPlayer(imageUrl: imageUrl, context: context),
                ),
              );
            } else {
              // Mostrar diálogo de error de autenticación
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error de autenticación'),
                  content: Text(
                      'Debes estar autenticado para realizar esta acción.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Cerrar el diálogo
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginScreen())); // Navegar a la pantalla de inicio de sesión
                      },
                      child: Text('Aceptar'),
                    ),
                  ],
                ),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl.isNotEmpty)
                Expanded(
                  child: Center(
                    child: Image.network(
                      imageUrl,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (song?.title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text(
                      song?.title ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> _checkCookieExistence() async {
    String cookieValue = await storage.read(key: 'Token') ?? 'No data found!';
    if (cookieValue == 'No data found!') {
      return false;
    } else {
      return true;
    }
  }
}
