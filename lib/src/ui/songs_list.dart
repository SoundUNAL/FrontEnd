import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sound_frontend/src/ui/login/login_screen.dart';
import 'package:sound_frontend/src/ui/music_player/music_player.dart';
import '../models/songs_model.dart';
import '../blocs/songs_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sound_frontend/src/ui/login/login_screen.dart';

final storage = FlutterSecureStorage();

class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllSongs();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 2, 2),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 2, 2),
        title: const Text('Descubre'),
      ),
      body: StreamBuilder(
        stream: bloc.allSongs,
        builder: (context, AsyncSnapshot<SongModel> snapshot) {
          if (snapshot.hasData) {
            return  buildCarouselSlider(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildCarouselSlider(AsyncSnapshot<SongModel> snapshot) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double viewportFraction = 0.6;
        if (constraints.maxWidth > 600) {
          viewportFraction = 0.2;
        }
        return CarouselSlider.builder(
          itemCount: snapshot.data?.songs.length ?? 0,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final song = snapshot.data?.songs[index];
            String imageUrl = song?.imageUrl ?? '';
            imageUrl = imageUrl.replaceAll('host.docker.internal', 'localhost');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageUrl.isNotEmpty)
                  GestureDetector(
                    onTap: () async {
                      bool cookieExists = await _checkCookieExistence();
                      if (cookieExists == false) {
                          showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                          title: Text('Error de autenticación'),
                          content: Text('Debes estar autenticado para realizar esta acción.'),
                          actions: [
                          TextButton(
                          onPressed: () {
                                Navigator.pop(context); // Cerrar el diálogo
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LoginScreen())); // Navegar a la pantalla de inicio de sesión
                          },
                          child: Text('Aceptar'),
                            ),
                            ],
                          ),  
                          );
                          } else {
                              // Si la cookie existe, realizar la acción (navegar a la pantalla de reproducción de música)
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => MusicPlayer(imageUrl: imageUrl, context: context),
                        ),
                      );  
                      }
                      },
                    child: Center(
                      child: Image.network(
                        imageUrl,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                if (song?.title != null) 
                  Center(
                    child: Text(
                      song?.title ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
              ],
            );
          },
          options: CarouselOptions(
            height: 800,
            enlargeCenterPage: true,
            viewportFraction: viewportFraction,
          ),
        );
      },
    );
  }


  Future<bool> _checkCookieExistence() async {
      String cookieValue = await storage.read(key: 'Token')  ?? 'No data found!';
      if (cookieValue == 'No data found!') {
        return false;
      } else {
        return true;
      }
  }
}
