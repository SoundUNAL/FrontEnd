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
                    children: [
                        Expanded(
                            child: NavBar(
                                title: Text("SoUNd"),
                            ),
                        ),
                        Container(
                          height: 350,
                          width: 1400,
                          child: SongList(),
                        ),
                        Container(
                          height: 300,
                          width: 600,
                          child: LastSongList(),
                        )
                    ],
                ),
			),
        );
    }
}
