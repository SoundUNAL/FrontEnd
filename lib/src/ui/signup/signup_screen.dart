import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/signup/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Registrate',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.normal,
            fontFamily: 'Bradley Hand',
            color: Colors.orange,
          ),
        ),
        Expanded(
          child: Image.asset('images/soUNd_logo.png'),
        ),
        const Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: SignupForm(),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
