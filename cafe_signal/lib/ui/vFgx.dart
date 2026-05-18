import 'package:cafe_signal/screens/Dashboard_screens.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // ឆែកឈ្មោះឱ្យត្រូវ

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManualSplashScreen(), // ឱ្យវាចាប់ផ្ដើមពី Splash នេះ
    ),
  );
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
      
    );
  }
}
