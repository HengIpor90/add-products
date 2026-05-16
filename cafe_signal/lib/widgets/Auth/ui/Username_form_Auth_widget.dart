import 'package:flutter/material.dart';

class UsernameFormAuthWidget extends StatelessWidget {
  const UsernameFormAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
      ),

      child: TextField(
        cursorColor: Colors.deepPurple,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.white),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          hintText: "Username",
          hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
          prefixIconColor: Colors.white.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}
