import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/songs_model.dart';
import '../blocs/songs_bloc.dart';

class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllSongs();
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.allSongs,
        builder: (context, AsyncSnapshot<SongModel> snapshot) {
          if (snapshot.hasData) {
            return  buildCarouselSlider(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildCarouselSlider(AsyncSnapshot<SongModel> snapshot) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double viewportFraction = 0.5;
        if (constraints.maxWidth > 600) {
          viewportFraction = 0.2;
        }
        return CarouselSlider.builder(
          itemCount: snapshot.data?.songs.length ?? 0,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final song = snapshot.data?.songs[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (song?.imageUrl != null)
                  Center(
                    child: Image.network(
                      song!.imageUrl!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (song?.title != null) 
                  Center(
                    child: Text(
                      song?.title ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                if (song?.userid != null) 
                  Center(
                    child: Text("Author ID: ${song!.userid}"),
                  ),
              ],
            );
          },
          options: CarouselOptions(
            height: 500,
            enlargeCenterPage: true,
            viewportFraction: viewportFraction,
          ),
        );
      },
    );
  }
}
