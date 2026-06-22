import 'package:flutter/material.dart';
import 'package:seif_portfolio/presentation/sections/header_section.dart';
import 'package:seif_portfolio/presentation/widgets/fly_in_animation.dart';

class SummerySection extends StatelessWidget {
  const SummerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle normalStyle = const TextStyle(
      fontSize: 16,
      fontFamily: 'Fira Code',
      height: 1.8,
      fontWeight: FontWeight.w500,
      color: Color(0xFF8B949E),
    );

    return FlyInAnimation(
      fromLeft: true,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFF30363D), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(title: "Professional Summary"),
            const SizedBox(height: 5),
            const Divider(color: Color(0xFF30363D), thickness: 1.5),
            const SizedBox(height: 25),
            RichText(
              text: TextSpan(
                style: normalStyle,
                children: [
                  const TextSpan(text: "I am a professional "),
                  _buildBoldWhiteWord("Flutter Developer"),
                  const TextSpan(
                    text:
                        " specialized in elite enterprise mobile application systems execution. My engineering philosophy revolves around unyielding implementation of ",
                  ),
                  _buildBoldWhiteWord("Clean Architecture boundaries"),
                  const TextSpan(text: ", rigid "),
                  _buildBoldWhiteWord("SOLID design principles"),
                  const TextSpan(text: ", and writing production-grade, "),
                  _buildBoldWhiteWord("zero-leak reactive Dart systems"),
                  const TextSpan(
                    text:
                        ". I don't just build cross-platform apps that run; I architect robust mobile ecosystems engineered for massive concurrency, ",
                  ),
                  _buildBoldWhiteWord("multi-role multi-tenant architectures"),
                  const TextSpan(
                    text:
                        ", and secure financial gateway communication pipelines. Through deep mastery of advanced state automation like Rhine-level ",
                  ),
                  _buildBoldWhiteWord("BLoC/Cubit"),
                  const TextSpan(
                    text:
                        " and custom native integrations, I bridge the gap between heavy enterprise backend capabilities and ultra-fluid, reactive client interfaces.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

WidgetSpan _buildBoldWhiteWord(String word) {
  return WidgetSpan(
    alignment: PlaceholderAlignment.middle,
    child: Text(
      word,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Fira Code',
        height: 1.8,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    ),
  );
}
