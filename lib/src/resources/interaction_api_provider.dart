import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/user_model.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';


class InteractionApiProvider{
    late final GraphQLClient _client;

    InteractionApiProvider() {
        final HttpLink httpLink = HttpLink('http://localhost:8000/graphql');
        _client = GraphQLClient(
            cache: GraphQLCache(),
            link: httpLink,
        );
    }




    Future<int> likes(int audioId)  async{
        final QueryOptions post = QueryOptions(
            document: gql('''
                query {
                    likes(audioId: $audioId)
                }
            '''),
        );  

        final QueryResult result = await _client.query(post);
        if (result.hasException) {
            throw Exception(result.exception.toString());
        } else {
            final int message = result.data?['likes'];
            if (message == null) {
                throw Exception("No se pudo obtener la información");
                return 0;
            } else {
                return message;
            }
        }
    }



    Future<int> dislikes(int audioId)  async{
        final QueryOptions post = QueryOptions(
            document: gql('''
                query {
                    dislikes(audioId: $audioId)
                }
            '''),
        );  

        final QueryResult result = await _client.query(post);
        if (result.hasException) {
            throw Exception(result.exception.toString());
        } else {
            final int message = result.data?['dislikes'];
            if (message == null) {
                throw Exception("No se pudo obtener la información");
                return 0;
            } else {
                return message;
            }
        }
    }

    Future<bool> userLiked(int userId, int audioId)  async{
        final QueryOptions post = QueryOptions(
            document: gql('''
                query {
                    userLiked(audioId: $audioId, userId: $userId)
                }
            '''),
        );  

        final QueryResult result = await _client.query(post);
        if (result.hasException) {
            throw Exception(result.exception.toString());
        } else {
            final bool message = result.data?['userLiked'];
            if (message == null) {
                throw Exception("No se pudo obtener la información");
                return false;
            } else {
                return message;
            }
        }
    }


    Future<bool> userDisliked(int userId, int audioId)  async{
        final QueryOptions post = QueryOptions(
            document: gql('''
                query {
                    userDisliked(audioId: $audioId, userId: $userId)
                }
            '''),
        );  

        final QueryResult result = await _client.query(post);
        if (result.hasException) {
            throw Exception(result.exception.toString());
        } else {
            final bool message = result.data?['userDisliked'];
            if (message == null) {
                throw Exception("No se pudo obtener la información");
                return false;
            } else {
                return message;
            }
        }
    }


// Mutaciones 

Future<bool> like(int userId, int audioId) async {
    final MutationOptions post = MutationOptions(
        document: gql('''
            mutation {
                like(userId: $userId, audioId: $audioId)
            }
        '''),
    );

    final QueryResult result = await _client.mutate(post);

    if (result.hasException) {
        throw Exception(result.exception.toString());
    } else {
        final bool message = result.data?['like'];
        if (message == null) {
            throw Exception("No se pudo realizar la acción");
            return false;
        } else {
            return message;
        }
    }
}


Future<bool> dislike(int userId, int audioId) async {
    print('enters api');
    final MutationOptions post = MutationOptions(
        document: gql('''
            mutation {
                dislike(userId: $userId, audioId: $audioId)
            }
        '''),
    );
    print('post query');
    final QueryResult result = await _client.mutate(post);
    print('after');

    if (result.hasException) {
        throw Exception(result.exception.toString());
    } else {
        final bool message = result.data?['dislike'];
        if (message == null) {
            throw Exception("No se pudo realizar la acción");
            return false;
        } else {
            return message;
        }
    }
}


Future<bool> deleteDislike(int userId, int audioId) async {
    final MutationOptions post = MutationOptions(
        document: gql('''
            mutation {
                deleteDislike(userId: $userId, audioId: $audioId)
            }
        '''),
    );

    final QueryResult result = await _client.mutate(post);

    if (result.hasException) {
        throw Exception(result.exception.toString());
    } else {
        final bool message = result.data?['deleteDislike'];
        if (message == null) {
            throw Exception("No se pudo realizar la acción");
            return false;
        } else {
            return message;
        }
    }
}


Future<bool> deleteLike(int userId, int audioId) async {
    final MutationOptions post = MutationOptions(
        document: gql('''
            mutation {
                deleteLike(userId: $userId, audioId: $audioId)
            }
        '''),
    );

    final QueryResult result = await _client.mutate(post);

    if (result.hasException) {
        throw Exception(result.exception.toString());
    } else {
        final bool message = result.data?['deleteLike'];
        if (message == null) {
            throw Exception("No se pudo realizar la acción");
            return false;
        } else {
            return message;
        }
    }
}

}

