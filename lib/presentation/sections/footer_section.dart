import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      decoration: const BoxDecoration(
        color: Color(0xFF03060A),
        border: Border(top: BorderSide(color: Color(0xFF1F293D))),
      ),
      child: const Center(
        child: Text(
          "// ALL ARCHITECTURAL LOOPS CLOSED PERFECTLY. DESIGNED BY SEIF TARIQ © 2026",
          style: TextStyle(
            fontFamily: 'Fira Code',
            color: Color(0xFF58A6FF),
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
      ),
    );
  }
}

 