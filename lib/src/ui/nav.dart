import 'package:flutter/material.dart';
import 'package:sound_frontend/src/blocs/upload_song_bloc.dart';
import 'package:sound_frontend/src/ui/button_notis.dart';
import 'package:sound_frontend/src/ui/login/login_screen.dart';
import 'package:sound_frontend/src/ui/searched_songs.dart';
import 'package:sound_frontend/src/ui/upload_view.dart';

class NavBar extends StatelessWidget {
    NavBar({required this.title, super.key});
    final Widget title;

    final TextEditingController _searchController = TextEditingController();
    
    @override
    Widget build(BuildContext context) {
        return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        color: const Color.fromARGB(255, 47, 15, 0),
        
        child: Row(
            children: [
            IconButton(
              icon: Image.asset('images/soUNd_logo.png'),
              tooltip: 'SoUNd',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );// Esto enviará al usuario de vuelta a la pantalla anterior
              },
            ),
            
            Expanded(
                child: title,
            ),
            SearchBar(
            trailing: [
              IconButton(
                onPressed: () {
                  String searchText = _searchController.text.trim();
                  if (searchText.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchedSongs(searchText: searchText),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.search),
              ),
            ],
            hintText: 'Buscar canciones, álbumes, artistas o podcasts',
            controller: _searchController,
          ),

            IconButton(
              icon: Icon(Icons.account_circle),
              tooltip: 'Profile',
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UploadScreen(),
                  ),
                );

              },
              iconSize: 60,
              
            ),
            const ButtonNotis(),
            ],
        ),
        );
    }
}