import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/button_notis.dart';


class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
			theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child:ButtonNotis(),
        ),
        ),
      );
    }
}
