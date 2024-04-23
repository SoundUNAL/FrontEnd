import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset('images/soUNd_logo.png'),
        ),
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: LoginForm(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
