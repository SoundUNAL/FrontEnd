import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/songs_model.dart';

class SongsBloc {
  final _repository = Repository();
  final _songsFetcher = PublishSubject<SongModel>();

  Observable<SongModel> get allSongs => _songsFetcher.stream;

  fetchAllSongs() async {
    SongModel songModel = await _repository.fetchAllSongs();
    _songsFetcher.sink.add(songModel);
  }

  dispose() {
    _songsFetcher.close();
  }
}

final bloc = SongsBloc();