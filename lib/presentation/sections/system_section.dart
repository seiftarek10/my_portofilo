import 'package:flutter/material.dart';
import 'package:seif_portfolio/data/portfolio_data.dart';
import 'package:seif_portfolio/presentation/sections/header_section.dart';

class SystemSection extends StatelessWidget {
  const SystemSection({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(title: "🛠️ CORE APPLICATION SYSTEMS MATRIX"),
          const SizedBox(height: 10),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: PortfolioData.architecturalParadigms
                .map(
                  (paradigm) => Container(
                    width: MediaQuery.of(context).size.width < 600
                        ? double.infinity
                        : 420,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161B22).withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFF21262D),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          paradigm["icon"],
                          color: const Color(0xFF6366F1),
                          size: 28,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                paradigm["title"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  fontFamily: 'Fira Code',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                paradigm["detail"],
                                style: const TextStyle(
                                  color: Color(0xFF8B949E),
                                  fontSize: 13,
                                  height: 1.6,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 30),
          HeaderSection(title: "🚀 DEPLOYMENT SYSTEMS ENGINE"),
          const SizedBox(height: 10),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            children: PortfolioData.deploymentPipelines
                .map(
                  (pipe) => Container(
                    width: 440,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFF30363D),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          pipe["icon"],
                          color: const Color(0xFF10B981),
                          size: 28,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pipe["title"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  fontFamily: 'Fira Code',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                pipe["detail"],
                                style: const TextStyle(
                                  color: Color(0xFF8B949E),
                                  fontSize: 13,
                                  height: 1.6,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

