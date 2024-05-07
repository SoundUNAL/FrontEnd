import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/welcome/start_options.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text(
            'Bienvenidos a SoUNd',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bradley Hand',
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
        ),
        Row(
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
                    child: StartOptions(),
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
