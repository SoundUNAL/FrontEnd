import 'package:flutter/material.dart';
import 'package:sound_frontend/src/ui/music_player/rep_bar.dart';
import 'package:sound_frontend/src/ui/music_player/search.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sound_frontend/src/ui/login/login_screen.dart';




class MusicPlayer extends StatelessWidget {
  final BuildContext context;
  
  final storage = FlutterSecureStorage();
  String imageUrl;
  MusicPlayer({Key? key, required this.imageUrl,  required this.context}) : super(key: key);

  void initState() {
    _verificarCookie();
  }


  Future<void> _verificarCookie() async {
    // Verificar si existe la cookie en el almacenamiento seguro
    String cookieValue = await storage.read(key: 'Token')  ?? 'No data found!';
    print('\n');
    
    print(cookieValue);

    if (cookieValue == 'No data found!') {
      // Si la cookie no existe, mostrar una alerta
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error de autenticación'),
          content: Text('Debes estar autenticado para acceder a esta vista.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el diálogo
                // Puedes redirigir a otra vista si lo deseas
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Aceptar'),
            ),
          ],
        ),
      );
    }
      
  }


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: buildPage(context, imageUrl),
      )
    );
  }

  //final GlobalKey<State<RepBar>> repBarKey = GlobalKey<State<RepBar>>();
  
  Widget buildPage(BuildContext context, imageUrl) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('SoUNd Music Player'),
      ),*/
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Stack(
              children: [
                Positioned(
                  left: 0,
                  child: IconButton(onPressed: (){
                    //repBarKey.currentState?.dispose();
                    Navigator.pop(context);
                    
                  }, 
                  icon: const Icon(Icons.arrow_back)),
                ),
                const Center(
                  child: Search(),
                )
              ],

            ),
            
            const SizedBox(
              height: 16.0,
            ),
            Image.network(
              imageUrl,
              height: 400,
              fit: BoxFit.cover,
            ),
            /*Image.asset(
              'images/dino1.png',
              height: 400,
              fit: BoxFit.cover,
            ),*/
          ],
        ),
      )),
      bottomNavigationBar: const BottomAppBar(
        child: RepBar(),
      ),
    );
  }
}
