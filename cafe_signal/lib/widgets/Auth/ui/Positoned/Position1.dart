import 'package:flutter/material.dart';

class Position1 extends StatelessWidget {
  const Position1({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      height: 200,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.deepOrange.withValues(alpha: 0.4),
              Colors.deepOrange.withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}
