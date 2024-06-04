import 'dart:async';
import 'package:sound_frontend/src/resources/interaction_api_provider.dart';

import '../models/interactions_model.dart';

class InteractionsRepository {
  final interactionsApiProvider = InteractionApiProvider();

    Future<int> likes(int audioId) => interactionsApiProvider.likes(audioId);
    Future<int> dislikes(int audioId) => interactionsApiProvider.dislikes(audioId);

    Future<bool> userLiked(int userId, int audioId) => interactionsApiProvider.userLiked(userId, audioId);
    Future<bool> userDisliked(int userId, int audioId) => interactionsApiProvider.userDisliked(userId, audioId);
    Future<bool> like(int userId, int audioId) => interactionsApiProvider.like(userId, audioId);
    Future<bool> dislike(int userId, int audioId) => interactionsApiProvider.dislike(userId, audioId);
    Future<bool> deleteLike(int userId, int audioId) => interactionsApiProvider.deleteLike(userId, audioId);
    Future<bool> deleteDislike(int userId, int audioId) => interactionsApiProvider.deleteDislike(userId, audioId);

}
