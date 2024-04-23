import 'package:flutter/material.dart';

class RepBar extends StatelessWidget {
  const RepBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: const Color.fromARGB(255, 102, 49, 3),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              //Prev song
            },
            icon: const Icon(Icons.skip_previous),
          ),
          IconButton(
            onPressed: () {
              // play
            },
            icon: const Icon(Icons.play_circle_fill_rounded),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              //next song
            },
            icon: const Icon(Icons.skip_next),
          ),
          const SizedBox(width: 8.0),
          Text('0:00', style: Theme.of(context).textTheme.bodySmall),
          Expanded(
            child: Slider(
              onChanged: (newValue) {
                //lo descubriré
              },
              value: 0.0,
            ),
          ),
          Text('0:00', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(Icons.thumb_up),
            onPressed: () {
              // Lógica para indicar que la canción es "Me gusta"
            },
          ),
          IconButton(
            icon: const Icon(Icons.thumb_down),
            onPressed: () {
              // Lógica para indicar que la canción es "No me gusta"
            },
          ),
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              // Volumen
            },
          ),
          IconButton(
            icon: const Icon(Icons.repeat),
            onPressed: () {
              // Lógica para cambiar el modo de repetición
            },
          ),
          IconButton(
            icon: const Icon(Icons.shuffle),
            onPressed: () {
              // Lógica para activar/desactivar la reproducción aleatoria
            },
          ),
          IconButton(
            icon: const Icon(Icons.comment),
            onPressed: () {
              showComments(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.lyrics_outlined),
            onPressed: () {
              // Lógica para mostrar la letra
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // Lógica para mostrar información sobre la canción o el artista
            },
          ),
        ],
      ),
    );
  }
}

void showComments(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 1, // Altura del bottom sheet
        child: ListView(
          children: const [
            ListTile(
              title: Text('Comentario 1'),
            ),

          ],
        ),
      );
    },
  );
}
