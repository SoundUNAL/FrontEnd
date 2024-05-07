import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class MenuItems extends StatelessWidget{
  const MenuItems({super.key});

  @override
  Widget build (BuildContext context){

    return Column(
      children: [
        Container(
          height: 120,
          color: Colors.black,
          child: const Text('Kenshi yonezu: Nueva canción en camino'),
        ),
        Container(
          height: 120,
          color: Colors.black,
          child: const Text('DragonForce: Nueva bajista en el grupo'),
        ),
        Container(
          height: 120,
          color: Colors.black,
          child: const Text('Symphony: Nuevo sencillo de Guilty Gear'),
        )
      ],
    );
  }


}