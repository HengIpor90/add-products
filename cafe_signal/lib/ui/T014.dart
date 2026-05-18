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
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // បង្ហាញតែ Logo រយៈពេល ២.៥ វិនាទី រួចប្តូរទៅទំព័រ Dashboard
    Timer(const Duration(milliseconds: 2500), () {
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
      // ប្រើពណ៌ត្នោតដែលត្រូវនឹងហាងកាហ្វេរបស់អ្នក
      backgroundColor: const Color(0xFF4E342E), 
      body: Center(
        child: SizedBox(
          width: 180, // កំណត់ទំហំ Logo តាមការចង់បាន
          height: 180,
          // ហៅរូបភាព Logo របស់អ្នកមកប្រើ
          child: Image.asset(
            'assets/logo.png', 
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}