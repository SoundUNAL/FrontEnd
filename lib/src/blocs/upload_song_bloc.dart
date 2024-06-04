import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/songs_model.dart';

class UploadSongBloc {
  final _repository = Repository();
  final _songsFetcher = PublishSubject<SongModel>();

  Stream<SongModel> get postedSong => _songsFetcher.stream;

  postSong(int albumid, String audioid, String lyrics, String publicationDate, String title, int userid, int version) async {
    try {
      await _repository.postSong(albumid, audioid, lyrics, publicationDate, title, userid, version);
      // SongModel songModel = await _repository.fetchSearchSongs(title);

      // _songsFetcher.sink.add(songModel);

    } catch (e) {
      _songsFetcher.addError(e);
    }
  }

  dispose() {
    _songsFetcher.close();
  }
}

final bloc = UploadSongBloc();
