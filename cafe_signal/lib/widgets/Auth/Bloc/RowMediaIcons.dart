
import 'package:cafe_signal/widgets/Auth/ui/Social_login/Apples_login.dart';
import 'package:cafe_signal/widgets/Auth/ui/Social_login/Facebook_login.dart';
import 'package:cafe_signal/widgets/Auth/ui/Social_login/Google_login.dart';
import 'package:flutter/material.dart';

class Rowmediaicons extends StatelessWidget {
  const Rowmediaicons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FacebookLogin(),
        SizedBox(width: 10),
        GoogleLogin(),
        SizedBox(width: 10),
        ApplesLogin(),
        // SizedBox(width: 20),
      ],
    );
  }
}
