import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/songs_model.dart';

class SongApiProvider {
  Future<SongModel> fetchSongList() async {

    final HttpLink httpLink = HttpLink('http://localhost:8000/graphql');

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    final QueryOptions options = QueryOptions(
      document: gql('''
        query {
          songs {
            id
            title
          }
        }
      '''),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> songsData = result.data?['songs'] ?? [];
    return SongModel.fromJson(songsData);
  }
}
