import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/music_player/rep_bar.dart';
import 'package:sound_frontend/src/ui/music_player/search.dart';

class MusicPlayer extends StatelessWidget {
  String imageUrl;
  MusicPlayer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: buildPage(context, imageUrl),
      )
    );
  }

  //final GlobalKey<State<RepBar>> repBarKey = GlobalKey<State<RepBar>>();
  
  Widget buildPage(BuildContext context, imageUrl) {
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
            Stack(
              children: [
                Positioned(
                  left: 0,
                  child: IconButton(onPressed: (){
                    //repBarKey.currentState?.dispose();
                    Navigator.pop(context);
                    
                  }, 
                  icon: const Icon(Icons.arrow_back)),
                ),
                const Center(
                  child: Search(),
                )
              ],

            ),
            
            const SizedBox(
              height: 16.0,
            ),
            Image.network(
              imageUrl,
              height: 400,
              fit: BoxFit.cover,
            ),
            /*Image.asset(
              'images/dino1.png',
              height: 400,
              fit: BoxFit.cover,
            ),*/
          ],
        ),
      )),
      bottomNavigationBar: const BottomAppBar(
        child: RepBar(),
      ),
    );
  }
}
