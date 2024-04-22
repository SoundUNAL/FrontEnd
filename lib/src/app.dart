import 'package:flutter/material.dart';
import 'ui/songs_list.dart';
import 'ui/music_player/music_player.dart';

class App extends StatelessWidget {
  @override
  /*Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SongList(),
      ),
    );
  }*/
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MusicPlayer(),
      )
    );
  }
}
