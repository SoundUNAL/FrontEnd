import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sound_frontend/src/models/comments_model.dart';
import '../../blocs/comments_bloc.dart';
import 'package:soundpool/soundpool.dart';

class RepBar extends StatelessWidget {
  const RepBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: const Color.fromARGB(255, 102, 49, 3),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              soundbutton();
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
  
  Future<void> soundbutton() async {
    // URL del archivo de audio
    const audioUrl = 'assets/sounds/Y2K_bbno_-_Lalala_Official_Video.mp3';

    // Crear un elemento de audio
    final audioElement = html.AudioElement(audioUrl);
    // Cargar el audio
    audioElement.load();
    // Reproducir el audio
    audioElement.play();
  }
}

void showComments(BuildContext context) {
  bloc.fetchComments();
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StreamBuilder<CommentModel>(
        stream: bloc.allComments, 
        builder: (BuildContext context, AsyncSnapshot<CommentModel> snapshot){
          if(snapshot.hasData){
            return FractionallySizedBox(
              heightFactor: 1, // Altura del bottom sheet
              child: ListView.builder(
                itemCount: snapshot.data?.comments.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(snapshot.data?.comments[index].comment as String),
                  );
                }
              )
            );
            
          } else if (snapshot.hasError){
            return const Center(child: Text('Error al obtener los comentarios'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      );
    },
  );
}

