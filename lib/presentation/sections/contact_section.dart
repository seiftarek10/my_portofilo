import 'package:flutter/material.dart';
import 'package:seif_portfolio/data/portfolio_data.dart';
import 'package:seif_portfolio/data/url_launcher.dart';
import 'package:seif_portfolio/presentation/sections/header_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
       return Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFF58A6FF).withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          HeaderSection(title:  "📞 CONTACT ME"),
          const SizedBox(height: 20),
          Wrap(
            spacing: 30,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: PortfolioData.contactLinks
                .map(
                  (info) => InkWell(
                    onTap: () => launchURL(info["url"] ?? ""),
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF06090E),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF21262D),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${info["label"]}: ",
                            style: const TextStyle(
                              color: Color(0xFF58A6FF),
                              fontFamily: 'Fira Code',
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            info["value"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Fira Code',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF10B981),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

