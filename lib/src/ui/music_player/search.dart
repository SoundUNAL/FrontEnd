import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      trailing: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
      hintText: 'Buscar canciones, albumes, artistas o podcasts',
    );
  }
}

