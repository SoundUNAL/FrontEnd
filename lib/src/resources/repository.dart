import 'dart:async';
import 'songs_api_provider.dart';
import '../models/songs_model.dart';

class Repository {
  final songsApiProvider = SongApiProvider();

  Future<SongModel> fetchAllSongs() => songsApiProvider.fetchSongList();

  Future<SongModel> fetchSearchSongs(title) => songsApiProvider.fetchSearchedSong(title);
}
