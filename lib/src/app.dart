import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/login/login_screen.dart';
import 'package:sound_frontend/src/ui/signup/signup_screen.dart';
import 'package:sound_frontend/src/ui/welcome/welcome_screen.dart';
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
  /*Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MusicPlayer(),
      )
    );
  }*/
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: SignupScreen(),
      )
    );
  }
}
