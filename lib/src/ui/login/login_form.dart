import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/signup/signup_screen.dart';
import 'package:sound_frontend/src/ui/utils/has_account.dart';
import '../../blocs/user_bloc.dart';
import '../../models/user_model.dart';
import 'package:sound_frontend/src/app.dart';

final TextEditingController _passwordController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();

class LoginForm extends StatelessWidget {
const LoginForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.orange,
            onSaved: (username) {},
            decoration: const InputDecoration(
              hintText: "Username",
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Colors.orange,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              
              var username = _usernameController.text;
              var password = _passwordController.text;
              
              userBloc.loginUser(username, password);
               
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return App();
                  },
                ),
              );


      
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: 16),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignupScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
