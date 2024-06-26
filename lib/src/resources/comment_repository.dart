import 'dart:async';
import 'comments_api_provider.dart';
import '../models/comments_model.dart';

class Repository {
  final commentsApiProvider = CommentApiProvider();

  Future<CommentModel> fetchAllSongs(audioId) => commentsApiProvider.fetchSongList(audioId);
  Future<void> postComment(audioId, userId, comment) => commentsApiProvider.postComment(audioId, userId, comment);
}
