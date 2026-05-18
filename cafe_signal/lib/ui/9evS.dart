import 'package:cafe_signal/screens/Dashboard_screens.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // ឆែកឈ្មោះឱ្យត្រូវ

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoolSplashScreen(), // ឱ្យវាចាប់ផ្ដើមពី Splash នេះ
    ),
  );
}

class CoolSplashScreen extends StatefulWidget {
  const CoolSplashScreen({super.key});

  @override
  State<CoolSplashScreen> createState() => _CoolSplashScreenState();
}

class _CoolSplashScreenState extends State<CoolSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // ១. បង្កើត Animation ឱ្យ Logo រីកបន្តិចៗ
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    // ២. កំណត់ពេលលោតទៅទំព័រ Dashboard
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const DashboardScreens(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  ); // លោតទៅបែបហើរចូល (Fade)
                },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E2723), // ពណ៌កាហ្វេដិត ងងឹតស្អាត
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ដាក់ Logo របស់អ្នក
              Image.asset(
                'assets/logo.png',
                width: 180,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.coffee_outlined,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // បន្ថែមអក្សរតិចៗឱ្យមើលទៅមាន Style
              const Text(
                "CAFÉ SIGNAL",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
