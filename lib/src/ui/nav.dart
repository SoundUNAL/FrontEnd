import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
    const NavBar({required this.title, super.key});
    final Widget title;
    
    @override
    Widget build(BuildContext context) {
        return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        
        child: Row(
            children: [
            const IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Navigation menu',
                onPressed: null, 
            ),
            
            Expanded(
                child: title,
            ),
            const IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: null,
            ),
            ],
        ),
        );
    }
}