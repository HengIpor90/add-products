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
              // ប្រើ Container ជាមួយ BoxDecoration ដើម្បីធ្វើឱ្យរូបភាពមូល
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // កំណត់រាងមូល
                  color: Colors.white, // ពណ៌ផ្ទៃក្រោយរបស់ Logo បើ Logo ថ្លា
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  // កាត់រូបភាពឱ្យមូលតាមរាង Container
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover, // ឱ្យរូបភាពរីកពេញរង្វង់
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.coffee_rounded,
                      size: 80,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "CAFÉ SIGNAL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
