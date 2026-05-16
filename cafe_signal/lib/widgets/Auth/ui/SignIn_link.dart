import 'package:cafe_signal/screens/Auth/LoginScreens.dart';
import 'package:flutter/material.dart';

class SigninLink extends StatelessWidget {
  const SigninLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Already an account . ",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginscreens(),
                          ),
                        );
                      },
                      child: Text("Sign In"),
                    ),
                  ],
                );
  }
}