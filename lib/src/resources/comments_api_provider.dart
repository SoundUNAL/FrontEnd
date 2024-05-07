import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/comments_model.dart';

class CommentApiProvider {
  Future<CommentModel> fetchSongList(audioId) async {
    final HttpLink httpLink = HttpLink('http://localhost:8000/graphql');

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

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
}
