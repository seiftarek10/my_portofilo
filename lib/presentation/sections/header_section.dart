import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth < 600 ? 24 : 36;

        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          alignment: Alignment.centerLeft,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Fira Code',
                    letterSpacing: 2,
                    color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-3, -3),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xFF58A6FF),
                        Color(0xFF6366F1),
                      ],
                    ).createShader(bounds),
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: fontSize, // حجم خط متغير
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Fira Code',
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
