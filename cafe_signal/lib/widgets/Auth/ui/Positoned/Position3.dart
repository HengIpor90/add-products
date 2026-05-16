import 'package:flutter/material.dart';

class Position3 extends StatelessWidget {
  const Position3({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -100,
      bottom: 300,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.deepOrangeAccent.withValues(alpha: 0.4),
              Colors.deepOrangeAccent.withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}
