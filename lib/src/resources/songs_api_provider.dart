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
            audioid
            imageUrl
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

  Future<SongModel> fetchSearchedSong(String title) async {
    final HttpLink httpLink = HttpLink('http://localhost:8000/graphql');

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    final QueryOptions options = QueryOptions(
      document: gql('''
        query {
          songByName(title: "$title") {
            id
            title
            audioid
            imageUrl
          }
        }
      '''),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> songsData = result.data?['songByName'] ?? [];
    return SongModel.fromJson(songsData);
  }

  Future<bool> postSong(int albumid, String audioid, String lyrics,
      String publicationDate, String title, int userid, int version) async {
    final HttpLink httpLink = HttpLink('http://localhost:8000/graphql');

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    final MutationOptions options = MutationOptions(
      document: gql('''

        mutation {
          createSong(
            albumid: $albumid
            audioid: "$audioid"
            lyrics: "$lyrics"
            publicationDate: "$publicationDate"
            title: "$title"
            userid: $userid
            version: $version
          )
        }
      '''),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return true;
  }
}
