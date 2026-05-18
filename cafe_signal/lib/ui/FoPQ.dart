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

