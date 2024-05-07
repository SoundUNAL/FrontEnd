import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/music_player/rep_bar.dart';
import 'package:sound_frontend/src/ui/music_player/search.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: buildPage(context),
      )
    );
  }

  Widget buildPage(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('SoUNd Music Player'),
      ),*/
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            ),
            const Search(),
            const SizedBox(
              height: 16.0,
            ),
            Image.asset(
              'images/dino1.png',
              height: 400,
              fit: BoxFit.cover,
            ),
          ],
        ),
      )),
      bottomNavigationBar: const BottomAppBar(
        child: RepBar(),
      ),
    );
  }
}
