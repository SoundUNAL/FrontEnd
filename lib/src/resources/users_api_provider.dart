import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/user_model.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class UserApiProvider {
  late final GraphQLClient _client;

  UserApiProvider() {
    final HttpLink httpLink = HttpLink('http://localhost:8000/graphql');
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }

  Future<bool> createUser(User user) async {
    final MutationOptions post = MutationOptions(
      document: gql('''
        mutation {
          signUser(
            username: "${user.username}",
            name: "${user.name}",
            lastname: "${user.lastname}",
            password: "${user.password}",
            email: "${user.email}",
            birthday: "1990-01-01T00:00:00Z",
            phone: "${user.phone}",
            role: "${user.role}"
          )
        }
      '''),
    );

    final QueryResult result = await _client.mutate(post);
    
    if (result.hasException) {
      throw Exception(result.exception.toString());
    } else {
      final String message = result.data?['createUser'];
      if (message == null || message.isEmpty) {
        throw Exception("No se pudo crear el usuario");
        return false;
      } else {

        print(message);
        return true;
        // Puedes realizar alguna acción adicional si lo deseas
      }
    }
  }

  Future<String> login(String username, String password) async {
    final QueryOptions post = QueryOptions(
      document: gql('''
        query {
          login(username: "$username", password: "$password")
        }
      '''),
    );

    final QueryResult result = await _client.query(post);
    
    if (result.hasException) {
      throw Exception(result.exception.toString());
    } else {
      final String message = result.data?['login'];
      if (message == null || message.isEmpty) {
        throw Exception("Respuesta inesperada del servidor");
        //return false;
      } else {
        print(message);
 
        return message;
        // Puedes realizar alguna acción adicional si lo deseas
      }
    }
  }



}
