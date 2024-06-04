import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/songs_model.dart';

class SearchSongsBloc {
  final _repository = Repository();
  final _searchsongsFetcher = PublishSubject<SongModel>();

  Stream<SongModel> get allSongs => _searchsongsFetcher.stream;

  fetchSearchSongs(String title) async {
    SongModel songModel = await _repository.fetchSearchSongs(title);
    _searchsongsFetcher.sink.add(songModel);
  }

  dispose() {
    _searchsongsFetcher.close();
  }
}

final bloc = SearchSongsBloc();
