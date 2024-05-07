import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/login/login_screen.dart';

class NavBar extends StatelessWidget {
    const NavBar({required this.title, super.key});
    final Widget title;
    
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
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
              hintText: 'Buscar canciones, albumes, artistas o podcasts',
            ),
            const IconButton(
              icon: Icon(Icons.account_circle),
              tooltip: 'Profile',
              onPressed: null,
              iconSize: 60,
            ),
            const IconButton(
              icon: Icon(Icons.notifications),
              tooltip: 'Profile',
              onPressed: null,
              iconSize: 60,
            ),
            ],
        ),
        );
    }
}