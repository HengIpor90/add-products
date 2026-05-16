import 'package:cafe_signal/widgets/home/AppBar_widget.dart';
import 'package:cafe_signal/widgets/home/Body_widget.dart';
import 'package:cafe_signal/widgets/home/Drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: HomeDrawer(), appBar: HomeBar(), body: HomeBody());
  }
}
