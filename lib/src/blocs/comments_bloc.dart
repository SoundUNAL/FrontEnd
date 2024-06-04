import 'dart:async';

import '../resources/comment_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class CommentsBloc {
  final _repository = Repository();
  final _commentsFetcher = PublishSubject<CommentModel>();
  final _commentsController = StreamController<CommentModel>.broadcast();

  Stream<CommentModel> get allComments => _commentsFetcher.stream;

  fetchComments(audioId) async {
    print('entra fecth comments bloc');
    try {
      CommentModel commentModel = await _repository.fetchAllSongs(audioId);
      _commentsFetcher.sink.add(commentModel);
    } catch (e){
      _commentsFetcher.sink.addError("Error al obtener comentarios: $e");
    }
    
  }

  postComment(int audioId, int userId, String comment) async {
    try {
      await _repository.postComment(audioId, userId, comment);
      fetchComments(audioId);
    }catch (e){
      _commentsController.sink.addError('Error al añadir el comentario: $e');
    }
  }

  dispose() {
    _commentsFetcher.close();
    _commentsController.close();
  }
}

final bloc = CommentsBloc();