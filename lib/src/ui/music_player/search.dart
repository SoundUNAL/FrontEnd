import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/searched_songs.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      trailing: [
        IconButton(
          onPressed: () {
            String searchText = _searchController.text.trim();
            if (searchText.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchedSongs(searchText: searchText),
                ),
              );
            }
          },
          icon: const Icon(Icons.search),
        ),
      ],
      hintText: 'Buscar canciones, álbumes, artistas o podcasts',
      controller: _searchController,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
