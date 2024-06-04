import 'dart:async';
import 'dart:html' as html;
// import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sound_frontend/src/blocs/interactions_bloc.dart';
import 'package:sound_frontend/src/models/comments_model.dart';
import '../../blocs/comments_bloc.dart';
// import 'package:soundpool/soundpool.dart';

class RepBar extends StatefulWidget {
  const RepBar({super.key});

  @override
  State<RepBar> createState() => _RepBarState();


  /*void dispose(){
    _RepBarState().dispose();
  }*/
}

class _RepBarState extends State<RepBar> {
  final String path = 'http://localhost:8000/play';
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool inLoop = false;
  Duration duration = Duration.zero;//(seconds: 252); //239 //177
  Duration position = Duration.zero;
  String audioId = '665ed643971643b767d2d86d';
  int audioInt = 1;
  int userId = 1;
  late bool isLiked;
  late bool isDisliked;
  //late bool isLiked = await reactsBloc.isLiked(audioInt, userId);
  //late bool isDisliked  = await reactsBloc.isDisliked(audioId, userId);


  @override
  void initState(){
    super.initState();
    setAudio(audioId);

    print('INIIIIIIIIIIIT');


    // isPlaying?
    audioPlayer.playerStateStream.listen((state) {
      print('enters playing');
      setState(() {
        isPlaying = state.playing;
      });
    });


    // duration
    audioPlayer.durationStream.listen((newDuration) {
      print('enters duration');
      setState(() {
        duration = newDuration!;
      });
    });

    // rep time
    audioPlayer.positionStream.listen((newPosition) {
      print('enters pos');
      setState(() {
        position = newPosition;
      });
    });

  }
  
  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  Future<bool> getIsLiked(audioId, userId) async {
    final response = await reactsBloc.isLiked(audioId, userId);
    return response.isLiked;
  }

  Future<bool> getIsDisliked(audioId, userId) async {
    final response = await reactsBloc.isDisliked(audioId, userId);
    return response.isDisliked;
  }

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
            onPressed: () async {
              // play
              //soundbutton();
              if(isPlaying) {
                await audioPlayer.pause();
              } else {
                //await audioPlayer.resume();
                await audioPlayer.play();
                
              }
            },
            icon: Icon(
              isPlaying ? Icons.pause_circle_filled_rounded: Icons.play_circle_fill_rounded,
            ),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              //next song
            },
            icon: const Icon(Icons.skip_next),
          ),
          const SizedBox(width: 8.0),
          Text(formatTime(position),
              style: Theme.of(context).textTheme.bodySmall),
          Expanded(
            child: Slider(
              onChanged: (value) async {
                final pos = Duration(seconds: value.toInt());
                await audioPlayer.seek(pos);
              },
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
            ),
          ),
          Text(formatTime(duration-position),
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(width: 8.0),
          FutureBuilder<bool>(
            future: getIsLiked(audioId,userId),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
              if(snapshot.hasData){
                isLiked = snapshot.data!;
                return IconButton(
                  icon: Icon(
                    isLiked ? Icons.thumb_up_alt: Icons.thumb_up_alt_outlined,
                  ),
                  onPressed: () {
                    // Lógica para indicar que la canción es "Me gusta"
                    if(isLiked){
                      reactsBloc.deleteLike(audioId, userId);
                      isLiked = false;
                    }else{
                      reactsBloc.like(audioId, userId);
                      isLiked = true;
                    }
                  },
                );

              } else {
                return const Icon(Icons.error);
              }
            },
          ),
          FutureBuilder<bool>(
            future: getIsDisliked(audioId, userId),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
              if(snapshot.hasData){
                isDisliked = snapshot.data!;
                return IconButton(
                  icon: Icon(
                    isDisliked ? Icons.thumb_down_alt: Icons.thumb_down_alt_outlined,
                  ),
                  onPressed: () {
                    // Lógica para indicar que la canción es "No me gusta"
                    if(isDisliked){
                      reactsBloc.deleteDislike(audioId, userId);
                      isDisliked = false;
                    }else{
                      print('pressed dislikee');
                      reactsBloc.dislike(audioId, userId);
                      isDisliked = true;
                    }
                  },
                );
              } else {
                return const Icon(Icons.error);
              }
            },
          ),
          /*IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              // Volumen
            },
          ),*/
          IconButton(
            icon: Icon(
              inLoop ? Icons.repeat_on: Icons.repeat,
            ),
            onPressed: () {
              // Lógica para cambiar el modo de repetición
              if(inLoop){
                inLoop = false;
                //audioPlayer.setReleaseMode(ReleaseMode.STOP);
                //audioPlayer.stop();
                audioPlayer.setLoopMode(LoopMode.off);
              }else{
                inLoop = true;
                //audioPlayer.setReleaseMode(ReleaseMode.LOOP);
                audioPlayer.setLoopMode(LoopMode.all);
              }
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
              showComments(context, audioInt, userId);
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

  Future setAudio(audioId) async {
    // String url = 'assets/sounds/Y2K_bbno_-_Lalala_Official_Video.mp3';
    //final player = AudioCache(prefix: 'sounds/');
    //final url = await player.load('Iron_Maiden_-_The_Trooper.mp3');
    //audioPlayer.setUrl(url.path, isLocal: true);
    audioPlayer.setUrl('sounds/Iron_Maiden_-_The_Trooper.mp3');

    // PARA CARGAR ARCHIVO DESDE API
    //String url ='$path/$audioId';
    //audioPlayer.setUrl(url);
    //


    //int d = await audioPlayer.getDuration();
    //duration = Duration(milliseconds: d);
  }


  String formatTime(Duration rep_time) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String min = twoDigits(rep_time.inMinutes.remainder(60));
    String sec = twoDigits((rep_time.inSeconds.remainder(60)));
    return '$min:$sec';
  }
  
  
}

void showComments(BuildContext context, audioInt, userId) {
  final TextEditingController _commentController = TextEditingController();
  
  bloc.fetchComments(audioInt);
  
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Para que el modal se ajuste cuando aparece el teclado
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.9, // Ajustar la altura del bottom sheet
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<CommentModel>(
                stream: bloc.allComments,
                builder: (BuildContext context, AsyncSnapshot<CommentModel> snapshot) {
                  print('previo verificacion snapshot');
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data?.comments[index].comment as String),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error al obtener los comentarios'),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Escribe un comentario...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      final newComment = _commentController.text.toString();
                      if (newComment.isNotEmpty) {
                        // Aquí debes llamar a tu función para añadir el comentario
                        bloc.postComment(audioInt, userId, newComment);
                        _commentController.clear();
                        html.window.location.reload();
                        // Opcional: Refrescar los comentarios después de añadir uno nuevo
                        // bloc.fetchComments(audioInt);
                      }
                    },
                    child: const Text('Post'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

