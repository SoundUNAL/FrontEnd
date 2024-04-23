import 'dart:async';
import 'users_api_provider.dart';
import '../models/user_model.dart';

class UserRepository {
  final userApiProvider = UserApiProvider();

  Future<bool> createUser(User user) => userApiProvider.createUser(user);
  
  Future<bool> login(String username, String password) => userApiProvider.login(username, password);
}
