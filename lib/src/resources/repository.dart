import 'dart:async';
import 'songs_api_provider.dart';
import '../models/songs_model.dart';

class Repository {
  final songsApiProvider = SongApiProvider();

  Future<SongModel> fetchAllSongs() => songsApiProvider.fetchSongList();

  Future<SongModel> fetchSearchSongs(title) => songsApiProvider.fetchSearchedSong(title);

  Future<bool> postSong(albumid, audioid, lyrics, publicationDate, title, userid, version) =>songsApiProvider.postSong(albumid, audioid, lyrics, publicationDate, title, userid, version);
}
