import 'dart:async';

import '../resources/interactions_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/interactions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class InteractionsBloc {
  final _repository = InteractionsRepository();
  //final _interactionsFetcher = PublishSubject<InteractionModel>();

  //Stream<InteractionModel> get allInteractions => _interactionsFetcher.stream;

  isLiked(audioId, userId) async {
    bool response = await _repository.userLiked(userId, audioId);
    return response;
  }

  isDisliked(audioId, userId) async {
    bool response = await _repository.userDisliked(userId, audioId);
    return response;
  }

  like(audioId, userId)async{
    await _repository.like(userId, audioId);
  }

  dislike(audioId, userId)async{
    print('enters bloc');
    await _repository.dislike(userId, audioId);
  }
  
  deleteLike(audioId, userId)async{
    await _repository.deleteLike(userId, audioId);
  }

  deleteDislike(audioId, userId)async{
    await _repository.deleteLike(userId, audioId);
  }

  dispose() {
    //_commentsFetcher.close();
  }
}

final reactsBloc = InteractionsBloc();