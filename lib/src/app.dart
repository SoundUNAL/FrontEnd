import 'package:flutter/material.dart';
import 'ui/songs_list.dart';
import 'ui/last_songs_list.dart';
import 'ui/nav.dart';

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        
        return MaterialApp(
			theme: ThemeData.dark(),
			home: Scaffold(
				body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Expanded(
                            child: NavBar(
                                title: Text("SoUNd"),
                            ),
                        ),
                        Expanded(
                            child: SongList(),
                            flex: 10,
                        ),
                        Expanded(
                          child: LastSongList(),
                          flex: 10,
                        ),
                    ],
                ),
			),
        );
    }
}
