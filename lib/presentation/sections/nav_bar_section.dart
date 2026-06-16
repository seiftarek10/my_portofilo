import 'package:flutter/material.dart';
import 'package:seif_portfolio/data/portfolio_data.dart';
import 'package:seif_portfolio/presentation/widgets/social_button.dart';

class NavBarSection extends StatelessWidget {
  const NavBarSection({
    super.key,
    required this.summaryKey,
    required this.projectsKey,
    required this.skillsKey,
    required this.architectureKey,
    required this.contactKey,
  });
  final GlobalKey summaryKey,
      projectsKey,
      skillsKey,
      architectureKey,
      contactKey;

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1117).withValues(alpha: 0.8),
          border: const Border(
            bottom: BorderSide(color: Color(0xFF1F293D), width: 1.5),
          ),
        ),
        child: Row(
          children: [
            const Text(
              PortfolioData.name,
              style: TextStyle(
                color: Color(0xFF58A6FF),
                fontFamily: 'Fira Code',
                fontWeight: FontWeight.w900,
                fontSize: 20, 
                letterSpacing: 2,
              ),
            ),
            const SizedBox(width: 20),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildNavButton("Summary", summaryKey),
                    _buildNavButton("Projects",projectsKey),
                    _buildNavButton("Skills", skillsKey),
                    _buildNavButton("Systems", architectureKey),
                    _buildNavButton("Contact", contactKey),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),
            // الأيقونات
            Row(
              children: [
                SocialButton(
                  icon: Icons.code_rounded,
                  tooltip: "GitHub",
                  url: "https://github.com/seiftarek10",
                  hoverColor: const Color(0xFF58A6FF),
                ),
                const SizedBox(width: 10),
                SocialButton(
                  icon: Icons.lan_rounded,
                  tooltip: "LinkedIn",
                  url: "https://www.linkedin.com/in/seif-tariq/",
                  hoverColor: const Color(0xFF0A66C2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String title, GlobalKey targetKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: () => _scrollToSection(targetKey),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Fira Code',
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
