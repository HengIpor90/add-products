import 'package:cafe_signal/screens/Dashboard_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // ១. ចាំបាច់ត្រូវមាន ដើម្បីឱ្យ Native Splash ដំណើរការបាន
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // ២. បញ្ជាឱ្យ Splash Screen ជាប់នៅទីនោះសិន (កុំទាន់ឱ្យវាបាត់)
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ៣. បើក App របស់អ្នក
  runApp( const DashboardScreens());
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
    initialization();
  }

  void initialization() async {
    // កន្លែងនេះអ្នកអាចដាក់ការ Load ទិន្នន័យពី Database ឬ API
    // ខ្ញុំដាក់ Delay ២ វិនាទី ដើម្បីឱ្យឃើញ Logo Splash ស្អាត
    await Future.delayed(const Duration(seconds: 2));

    // ៤. នៅពេល App រៀបចំរួចរាល់ យើងបញ្ជាឱ្យបិទ Splash Screen ទៅវិញ
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Café Signal',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: DashboardScreens(),
    );
  }
}
