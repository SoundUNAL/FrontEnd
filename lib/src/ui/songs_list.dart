import 'package:flutter/material.dart';
import '../models/songs_model.dart';
import '../blocs/songs_bloc.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllSongs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs SoUNd'),
      ),
      body: StreamBuilder(
        stream: bloc.allSongs,
        builder: (context, AsyncSnapshot<SongModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<SongModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.songs.length ??
          0, // Verifica si snapshot.data y snapshot.data.songs son nulos antes de acceder a la propiedad length
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(snapshot.data?.songs[index].title ??
              ''), // Verifica si snapshot.data y snapshot.data.songs son nulos antes de acceder a la propiedad title
        );
      },
    );
  }
}
