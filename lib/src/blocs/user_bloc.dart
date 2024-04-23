import '../resources/user_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/user_model.dart';

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

  Future<void> loginUser(String username, String password) async {
    try {
      await _repository.login(username, password);
      // Si necesitas realizar alguna acción adicional después de iniciar sesión, puedes hacerlo aquí
    } catch (e) {
      _userFetcher.addError(e);
    }
  }

  dispose() {
    _userFetcher.close();
  }
}

final userBloc = UserBloc();
