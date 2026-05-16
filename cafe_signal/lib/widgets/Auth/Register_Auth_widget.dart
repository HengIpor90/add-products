import 'package:cafe_signal/widgets/Auth/Bloc/Content_bloc.dart';
import 'package:cafe_signal/widgets/Auth/Bloc/RowMediaIcons.dart';
import 'package:cafe_signal/widgets/Auth/ui/Email_form_Auth_widget.dart';
import 'package:cafe_signal/widgets/Auth/ui/Password_form_Auth_widget.dart';
import 'package:cafe_signal/widgets/Auth/ui/Positoned/Position1.dart';
import 'package:cafe_signal/widgets/Auth/ui/Positoned/Position2.dart';
import 'package:cafe_signal/widgets/Auth/ui/Positoned/Position3.dart';
import 'package:cafe_signal/widgets/Auth/ui/Re_password_form_Auth_widget.dart';
import 'package:cafe_signal/widgets/Auth/ui/RegBtn.dart';
import 'package:cafe_signal/widgets/Auth/ui/SignIn_link.dart';
import 'package:cafe_signal/widgets/Auth/ui/Username_form_Auth_widget.dart';
import 'package:flutter/material.dart';

class RegisterAuthWidget extends StatefulWidget {
  const RegisterAuthWidget({super.key});

  @override
  State<RegisterAuthWidget> createState() => _RegisterAuthWidgetState();
}

class _RegisterAuthWidgetState extends State<RegisterAuthWidget> {
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
            height: size.height * 0.65,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),

            width: size.width * 0.9,
            // field
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
                  "please register to continue",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
                SizedBox(height: 30),
                // Field Username
                UsernameFormAuthWidget(),
                SizedBox(height: 20),
                // field Email
                EmailFormAuthWidget(),
                SizedBox(height: 20),
                // Field Password
                PasswordFormAuthWidget(),
                SizedBox(height: 20),
                // Field Re_Password
                RePasswordFormAuthWidget(),

                SizedBox(height: 20),
                // btn
                Regbtn(),

                SizedBox(height: 20),
                // sign up link
                SigninLink(),
                SizedBox(height: 20),

                // social media login
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(color: Colors.white24, thickness: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or continue with",
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
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
