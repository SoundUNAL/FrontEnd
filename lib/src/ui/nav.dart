import 'package:flutter/material.dart';

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
              onPressed: null,
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
            ],
        ),
        );
    }
}