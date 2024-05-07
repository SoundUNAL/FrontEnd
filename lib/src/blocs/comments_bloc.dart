import '../resources/comment_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/comments_model.dart';

class CommentsBloc {
  final _repository = Repository();
  final _commentsFetcher = PublishSubject<CommentModel>();

  Stream<CommentModel> get allComments => _commentsFetcher.stream;

  fetchComments() async {
    CommentModel commentModel = await _repository.fetchAllSongs();
    _commentsFetcher.sink.add(commentModel);
  }

  dispose() {
    _commentsFetcher.close();
  }
}

final bloc = CommentsBloc();