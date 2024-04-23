class UserModel {
  late User _user;

  UserModel.fromJson(Map<String, dynamic>? json) {
    _user = User.fromJson(json);
  }

  User get user => _user;
}

class User {
  int? id;
  String? email;
  String? password;
  String? name;
  String? lastname;
  String? username;
  String? phone;
  String? birthdate;
  String? role;

  User({
    required this.name,
    required this.lastname,
    required this.email,
    required this.username,
    required this.password,
    required this.phone,
    required this.birthdate,
    required this.role,
  });
  
  // Constructor predeterminado
  User.defaultUser()
      : name = '',
        lastname = '',
        email = '',
        username = '',
        password = '',
        phone = '',
        birthdate = '',
        role = '';


  User.fromJson(Map<String, dynamic>? json) {
    id = json?["id"];
    email = json?["email"];
    password = json?["password"];
    name = json?["name"];
    lastname = json?["lastname"];
    username = json?["username"];
    phone = json?["phone"];
    birthdate = json?["birthdate"];
    role = json?["role"];
  }
}