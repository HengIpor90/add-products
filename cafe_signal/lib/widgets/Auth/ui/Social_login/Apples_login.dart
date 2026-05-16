import 'package:flutter/material.dart';

class ApplesLogin extends StatelessWidget {
  const ApplesLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white24),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    Color(0xFFffffff),
                                    Color(0xFFb0b0b0),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds);
                              },
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.apple,
                                  size:
                                      30, // ដោះ comment ចេញ ហើយដាក់ទំហំឱ្យធំទើបមើលឃើញ Gradient ច្បាស់
                                  color: Colors
                                      .white, // ត្រូវតែដាក់ពណ៌ស ដើម្បីឱ្យ Shader បាញ់ពណ៌ពីលើឃើញ
                                ),
                              ),
                            ),
                          );
  }
}