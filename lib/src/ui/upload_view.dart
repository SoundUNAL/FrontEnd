//import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:rxdart/rxdart.dart';
import '../blocs/upload_song_bloc.dart';

//import 'package:flutter/widgets.dart';

TextEditingController ControllerTitulo = new TextEditingController();
TextEditingController ControllerLyrics = new TextEditingController();
TextEditingController ControllerArtista = new TextEditingController();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'SoUNd';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const UploadScreen(),
      ),
    );
  }
}

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  
  get time => null;

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400, // Ancho deseado para ExampleDragTarget
                child: Align(
                  alignment: Alignment.topLeft, // Alineación vertical al inicio
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(onPressed: () async{

                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['mp3', 'm4a', 'wav','wma'],
                        );
                      if(kIsWeb){
                        if(result!=null){
                          print(result.files.first.name);
                        }
                        
                      }else if(Platform.isAndroid){
                        
                        if (result != null) {
                          print(result.files.single.path);
                        }else {
                            // User canceled the picker
                          }

                      }
                      }
                      ,child: Text("Seleccionar canción"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(onPressed: () async{

                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                        allowedExtensions: ['png', 'jpg', 'jpeg','bmp'],
                        );

                      if(kIsWeb){
                        if(result!=null){
                          print(result.files.first.name);
                        }
                        
                      }else if(Platform.isAndroid){
                        
                        if (result != null) {
                          print(result.files.single.path);
                        }else {
                            // User canceled the picker
                          }
                      }


                      }
                      ,child: Text("Seleccionar Portada"),
                    ),
                  ),
                  ],

                  ),
                    

                ),
              ),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Material(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Titulo',
                          ),
                          controller: ControllerTitulo,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Material(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Lyrics',
                          ),
                          controller: ControllerLyrics,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Material(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Artista',
                          ),
                          controller: ControllerArtista,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
        ElevatedButton(onPressed: () {
          bloc.postSong(1,"b",ControllerLyrics.text.toString(),"2024-05-11T12:30:00.000Z","prueba2",1,1);
          
          print(ControllerLyrics.text);
          BuildContext: (context) => const App();
        }, child: Text("Subir canción")),
        
      ],
    );
    
  }
}
