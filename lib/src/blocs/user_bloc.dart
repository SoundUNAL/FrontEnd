import '../resources/user_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class UserBloc {
  final _repository = UserRepository();
  final _userFetcher = PublishSubject<UserModel>();

  Stream<UserModel> get userInfo => _userFetcher.stream;

  Future<void> createUser(User user) async {
    try {
      await _repository.createUser(user);
      // Si necesitas realizar alguna acción adicional después de crear el usuario, puedes hacerlo aquí
    } catch (e) {
      _userFetcher.addError(e);
    }
  }
//hola copilont 

  Future<void> loginUser(String username, String password , FlutterSecureStorage storage ) async {
    try {
      String message = await _repository.login(username, password);
      // Si necesitas realizar alguna acción adicional después de iniciar sesión, puedes hacerlo aquí
      await storage.write(key: 'Token', value: message );

      print('Cookie guardada en el almacenamiento seguro.');
      
      //String value = await storage.read(key: key);
      String value = await storage.read(key: 'Token' ) ?? 'No data found!';
      print('Data read from secure storage: $value');

      
    } catch (e) {
      _userFetcher.addError(e);
    }
  }

  dispose() {
    _userFetcher.close();
  }
}

final userBloc = UserBloc();
