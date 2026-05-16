import 'package:flutter/material.dart';

class EmailFormAuthWidget extends StatelessWidget {
  const EmailFormAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
      ),

      child: TextField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.deepPurple,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.white),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          hintText: "Enter Email Address",
          hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
          prefixIconColor: Colors.white.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}
