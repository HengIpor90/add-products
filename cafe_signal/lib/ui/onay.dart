import 'package:cafe_signal/screens/Dashboard_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // ត្រូវតែមានដើម្បីឱ្យ Native Splash ដំណើរការ
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // រក្សា Splash ទុកសិន (កុំទាន់ឱ្យបាត់)
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _removeSplash();
  }

  void _removeSplash() async {
    // បង្ហាញ Splash ២ វិនាទី
    await Future.delayed(const Duration(seconds: 2));

    // បញ្ជាឱ្យបិទ Splash ទៅវិញ
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardScreens(),
    );
  }
}
