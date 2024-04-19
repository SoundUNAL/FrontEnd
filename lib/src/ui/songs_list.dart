import 'package:flutter/material.dart';
import '../models/songs_model.dart';
import '../blocs/songs_bloc.dart';

class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllSongs();
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs SoUNd'),
      ),
      // body: StreamBuilder(
      //   stream: bloc.allSongs,
      //   builder: (context, AsyncSnapshot<SongModel> snapshot) {
      //     if (snapshot.hasData) {
      //       return buildList(snapshot);
      //     } else if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),
    );
  }

  // Widget buildList(AsyncSnapshot<SongModel> snapshot) {
  //   return GridView.builder(
  //       itemCount: snapshot.data.songs.length,
  //       gridDelegate:
  //           new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //       itemBuilder: (BuildContext context, int index) {
  //         return Image.network(
  //           'https://image.tmdb.org/t/p/w185${snapshot.data.songs[index].poster_path}',
  //           fit: BoxFit.cover,
  //         );
  //       });
  // }
}
