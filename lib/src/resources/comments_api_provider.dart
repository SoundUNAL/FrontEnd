import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/comments_model.dart';

class CommentApiProvider {
  late final GraphQLClient client;

  CommentApiProvider(){
    final HttpLink httpLink = HttpLink('http://localhost:8000/graphql');
    client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }

  Future<CommentModel> fetchSongList(audioId) async {

    final QueryOptions options = QueryOptions(
      document: gql('''
        query {
          getComments(audioId: $audioId) {
            comment
            userID
          }
        }
      '''),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> commentsData = result.data?['getComments'] ?? [];
    return CommentModel.fromJson(commentsData);
  }

  Future<void> postComment(int audioId, int userId, String comment) async{
    print('api provider');

    final MutationOptions options = MutationOptions(
      document: gql('''
        mutation {
           postComment(audioId: $audioId, comment: "$comment", userId: $userId)
        }
      '''),
    );

    print('before result');

    final QueryResult result = await client.mutate(options);

    print('after result');

    if(result.hasException){
      throw Exception(result.exception.toString());
    }
  }
}
