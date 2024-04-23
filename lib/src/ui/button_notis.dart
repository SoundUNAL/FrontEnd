import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:sound_frontend/src/ui/menu_items.dart';

class ButtonNotis extends StatelessWidget{

  const ButtonNotis({super.key});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => showPopover(
      context: context,
      bodyBuilder: (context)=> MenuItems(),
      width: 250,
      height: 180,
      direction: PopoverDirection.bottom,
      ),
      child:const Icon(Icons.notifications, size: 60),
    );
  }


}