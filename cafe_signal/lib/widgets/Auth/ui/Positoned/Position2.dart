import 'package:flutter/material.dart';

class Position2 extends StatefulWidget {
  const Position2({super.key});

  @override
  State<Position2> createState() => _Position2State();
}

class _Position2State extends State<Position2> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.deepPurple.withValues(alpha: 0.4),
              Colors.deepPurple.withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}