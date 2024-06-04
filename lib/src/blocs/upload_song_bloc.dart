import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/songs_model.dart';

class UploadSongBloc {
  final _repository = Repository();
  final _songsFetcher = PublishSubject<SongModel>();
  final _relatedSongsFetcher = PublishSubject<SongModel>(); 

  Stream<SongModel> get postedSong => _songsFetcher.stream;
  Stream<SongModel> get relatedSongs => _relatedSongsFetcher.stream;

  postSong(int albumid, String audioid, String lyrics, String publicationDate,
      String title, int userid, int version) async {
    try {
      await _repository.postSong(
          albumid, audioid, lyrics, publicationDate, title, userid, version);

      SongModel relatedSongs = await _repository.fetchSearchSongs(title);
      _relatedSongsFetcher.sink.add(relatedSongs);

    } catch (e) {
      _songsFetcher.addError(e);
    }
  }

  dispose() {
    _songsFetcher.close();
    _relatedSongsFetcher.close();
  }
}

final bloc = UploadSongBloc();
