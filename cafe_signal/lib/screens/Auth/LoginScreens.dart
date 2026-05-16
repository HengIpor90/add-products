import 'package:cafe_signal/widgets/Auth/Login_Auth_widget.dart';
import 'package:flutter/material.dart';

class Loginscreens extends StatefulWidget {
  const Loginscreens({super.key});

  @override
  State<Loginscreens> createState() => _LoginscreensState();
}

class _LoginscreensState extends State<Loginscreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginAuthWidget());
  }
}
