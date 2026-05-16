import 'package:cafe_signal/screens/views/home_views.dart';
import 'package:flutter/material.dart';

class DashboardScreens extends StatefulWidget {
  const DashboardScreens({super.key});

  @override
  State<DashboardScreens> createState() => _DashboardScreensState();
}

class _DashboardScreensState extends State<DashboardScreens> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Café_Signal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeViews(),
    );
  }
}