import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:const Text("Home"),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      ],
      backgroundColor: Colors.brown[200],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
