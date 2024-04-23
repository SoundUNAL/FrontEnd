import 'package:flutter/material.dart';
import 'ui/songs_list.dart';
import 'ui/last_songs_list.dart';
import 'ui/nav.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 35, 35, 35),
                Color.fromARGB(255, 2, 2, 2),
                Color.fromARGB(255, 2, 2, 2),
                Color.fromARGB(255, 35, 35, 35),
              ],
              stops: [0.0, 0.05, 0.95, 1.0],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 80,
                child: const NavBar(
                  title: Text("SoUNd", style: TextStyle(fontSize: 25)),
                ),
              ),
              Container(
                height: 350,
                width: 1300,
                child: SongList(),
              ),
              Container(
                height: 250,
                width: 600,
                child: LastSongList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
