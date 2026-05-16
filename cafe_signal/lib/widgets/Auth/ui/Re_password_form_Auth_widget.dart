import 'package:flutter/material.dart';

class RePasswordFormAuthWidget extends StatefulWidget {
  const RePasswordFormAuthWidget({super.key});

  @override
  State<RePasswordFormAuthWidget> createState() => _RePasswordFormAuthWidgetState();
}

class _RePasswordFormAuthWidgetState extends State<RePasswordFormAuthWidget> {
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
                    // ៣. ប្រើ Variable ត្រង់នេះ
                    obscureText: _isObscured,
                    cursorColor: Colors.deepPurple,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_reset,
                        color: Colors.white,
                      ),

                      // ៤. បន្ថែម IconButton នៅខាងចុង (SuffixIcon)
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

                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                );
  }
}