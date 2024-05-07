import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/songs_model.dart';
import '../blocs/songs_bloc.dart';

class LastSongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllSongs();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 2, 2),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 2, 2),
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double viewportFraction = 0.3;
        if (constraints.maxWidth > 600) {
          viewportFraction = 0.2;
        }
        return CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            // Obtener las últimas 5 canciones
            final last5Songs = snapshot.data!.songs.sublist(
              snapshot.data!.songs.length - 5,
              snapshot.data!.songs.length,
            );
            final song = last5Songs[index];
            String imageUrl = song?.imageUrl ?? '';
            imageUrl = imageUrl.replaceAll('host.docker.internal', 'localhost');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageUrl.isNotEmpty)
                  Center(
                    child: Image.network(
                      imageUrl,
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
              ],
            );
          },
          options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            viewportFraction: viewportFraction,
          ),
        );
      },
    );
  }
}
