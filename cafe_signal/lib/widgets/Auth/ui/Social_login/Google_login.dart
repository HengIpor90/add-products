import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

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
            begin: Alignment.topLeft,
            colors: [
              Color(0xFF4285F4),
              Color(0xFFEA4335),
              Color(0xFFFBBC05),
              Color(0xFF34A853),
            ],
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.g_mobiledata,
            size:
                30, // ដោះ comment ចេញ ហើយដាក់ទំហំឱ្យធំទើបមើលឃើញ Gradient ច្បាស់
            color:
                Colors.white, // ត្រូវតែដាក់ពណ៌ស ដើម្បីឱ្យ Shader បាញ់ពណ៌ពីលើឃើញ
          ),
        ),
      ),
    );
  }
}
