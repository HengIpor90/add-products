import 'package:flutter/material.dart';
class PasswordFormAuthWidget extends StatefulWidget {
  const PasswordFormAuthWidget({super.key});

  @override
  State<PasswordFormAuthWidget> createState() => _PasswordFormAuthWidgetState();
}

class _PasswordFormAuthWidgetState extends State<PasswordFormAuthWidget> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    obscureText: _isObscured,
                    cursorColor: Colors.deepPurple,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                      prefixIconColor: Colors.white.withValues(alpha: 0.3),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // បើ true បង្ហាញរូបភ្នែកបិទ បើ false បង្ហាញរូបភ្នែកបើក
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          // ៥. ប្រើ setState ដើម្បី Update UI ពេលចុច
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                    ),
                  ),
                );
  }
}