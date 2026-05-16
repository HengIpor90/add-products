
import 'package:cafe_signal/widgets/Auth/Bloc/Content_bloc.dart';
import 'package:cafe_signal/widgets/Auth/Bloc/RowMediaIcons.dart';
import 'package:cafe_signal/widgets/Auth/ui/Email_form_Auth_widget.dart';
import 'package:cafe_signal/widgets/Auth/ui/Logbtn.dart';
import 'package:cafe_signal/widgets/Auth/ui/Password_form_Auth_widget.dart';
import 'package:cafe_signal/widgets/Auth/ui/Positoned/Position1.dart';
import 'package:cafe_signal/widgets/Auth/ui/Positoned/Position2.dart';
import 'package:cafe_signal/widgets/Auth/ui/Positoned/Position3.dart';
import 'package:cafe_signal/widgets/Auth/ui/SignUp_link.dart';
import 'package:flutter/material.dart';

class LoginAuthWidget extends StatefulWidget {
  const LoginAuthWidget({super.key});

  @override
  State<LoginAuthWidget> createState() => _LoginAuthWidgetState();
}

class _LoginAuthWidgetState extends State<LoginAuthWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: kGradientBackgroundColor),
        ),
        Position1(),
        Position2(),
        Position3(),
        Center(
          child: Container(
            padding: EdgeInsets.all(20),
            height: size.height * 0.525,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),

            width: size.width * 0.9,

            child: Column(
              children: [
                Text(
                  "Welcome back! ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "please signin to continue",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
                SizedBox(height: 20),
                // Field email
                EmailFormAuthWidget(),
                SizedBox(height: 20),
                // Field pass
                PasswordFormAuthWidget(),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // btn Login
                Logbtn(),
                // --review--
                // sign up link
                SizedBox(height: 20),
                SignupLink(),
                // social media login
                SizedBox(height: 20),

                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.white24, thickness: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or continue with",
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: .5),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(color: Colors.white24, thickness: 1),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10), // គម្លាតពីបន្ទាត់មក Icon
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Rowmediaicons(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
