import 'package:cafe_signal/screens/Dashboard_screens.dart';
import 'package:flutter/material.dart';
import 'dart:async';// ឆែកឈ្មោះឱ្យត្រូវ

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ManualSplashScreen(), // ឱ្យវាចាប់ផ្ដើមពី Splash នេះ
  ));
}

class ManualSplashScreen extends StatefulWidget {
  const ManualSplashScreen({super.key});

  @override
  State<ManualSplashScreen> createState() => _ManualSplashScreenState();
}

class _ManualSplashScreenState extends State<ManualSplashScreen> {
  @override
  void initState() {
    super.initState();
    // កំណត់ពេល ៣ វិនាទី រួចលោតទៅ Dashboard
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreens()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8D6E63), // ពណ៌ត្នោត Café
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // បើអ្នកមានរូប Logo ក្នុង assets ប្រើ Image.asset('assets/logo.png')
            const Icon(Icons.coffee_maker, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              "CAFÉ SIGNAL",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}