import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/songs_model.dart';
import '../blocs/songs_bloc.dart';

class LastSongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllSongs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lo más reciente'),
      ),
      body: StreamBuilder(
        stream: bloc.allSongs,
        builder: (context, AsyncSnapshot<SongModel> snapshot) {
          if (snapshot.hasData) {
            return buildLast5SongsCarousel(snapshot);
          
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildLast5SongsCarousel(AsyncSnapshot<SongModel> snapshot) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        // Obtener las últimas 5 canciones
        final last5Songs = snapshot.data!.songs.sublist(
          snapshot.data!.songs.length - 5,
          snapshot.data!.songs.length,
        );
        final song = last5Songs[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (song.imageUrl != null)
              Center(
                child: Image.network(
                  song.imageUrl!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            if (song.title != null)
              Center(
                child: Text(
                  song.title ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            if (song.userid != null)
              Center(
                child: Text("Author ID: ${song.userid}"),
              ),
          ],
        );
      },
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        viewportFraction: 0.2,
      ),
    );
  }
}