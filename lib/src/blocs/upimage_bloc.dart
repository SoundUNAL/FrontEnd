import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/songs_api_provider.dart';


class UploadImageBloc {
  final _repository = Repository();
  final _songsFetcher = PublishSubject<UploadImageBloc>();

  Stream<UploadImageBloc> get uploadedImage => _songsFetcher.stream;

  uploadImage(idimage,imagefile,name) async {
    try {
      await _repository.uploadImage(idimage,imagefile,name);

    } catch (e) {
      _songsFetcher.addError(e);
    }
  }


  dispose() {
    _songsFetcher.close();
  }
}

final bloc = UploadImageBloc();