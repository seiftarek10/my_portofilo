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
    required this.isMenuOpen,
    required this.onMenuToggle,
  });
  final GlobalKey summaryKey,
      projectsKey,
      skillsKey,
      architectureKey,
      contactKey;
  final bool isMenuOpen;
  final VoidCallback onMenuToggle;

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
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= 600;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          height: (isMobile && isMenuOpen) ? 350 : 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1117).withValues(alpha: 0.9),
            border: const Border(
              bottom: BorderSide(color: Color(0xFF1F293D), width: 1.5),
            ),
          ),
          child: isMobile
              ? _buildMobileLayout(isMobile)
              : _buildDesktopLayout(),
        );
      },
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        _buildLogo(),
        const Spacer(),
        _buildNavItems(),
        const SizedBox(width: 20),
        _buildSocialButtons(),
      ],
    );
  }

  Widget _buildMobileLayout(bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLogo(),
            const Spacer(),
            IconButton(
              icon: Icon(
                isMenuOpen ? Icons.close : Icons.menu,
                color: Colors.white,
              ),
              onPressed: onMenuToggle,
            ),
          ],
        ),
        if (isMenuOpen) ...[
          const Divider(color: Color(0xFF1F293D)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton("Summary", summaryKey),
                _buildNavButton("Skills", skillsKey),
                _buildNavButton("Projects", projectsKey),
                _buildNavButton("Systems", architectureKey),
                _buildNavButton("Contact", contactKey),
              ],
            ),
          ),
        ],
      ],
    );
  }

  // Helper methods to keep code clean
  Widget _buildLogo() => Center(
    child: const Text(
      PortfolioData.name,
      style: TextStyle(
        color: Color(0xFF58A6FF),
        fontFamily: 'Fira Code',
        fontWeight: FontWeight.w900,
        fontSize: 20,
      ),
    ),
  );

  Widget _buildNavItems() => Row(
    children: [
      _buildNavButton("Summary", summaryKey),
      _buildNavButton("Projects", projectsKey),
      _buildNavButton("Skills", skillsKey),
      _buildNavButton("Systems", architectureKey),
      _buildNavButton("Contact", contactKey),
    ],
  );

  Widget _buildSocialButtons() => Row(
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
  );

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
