import 'package:flutter/material.dart';
import 'package:seif_portfolio/data/url_launcher.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.url,
    required this.hoverColor,
  });
  final IconData icon;
  final String tooltip;
  final String url;
  final Color hoverColor;
  @override
  Widget build(BuildContext context) {
    bool isIconHovered = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isIconHovered = true),
          onExit: (_) => setState(() => isIconHovered = false),
          child: Tooltip(
            message: tooltip,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isIconHovered
                    ? hoverColor.withValues(alpha: 0.1)
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isIconHovered ? hoverColor : const Color(0xFF30363D),
                  width: 1.5,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  icon,
                  color: isIconHovered ? hoverColor : Colors.white,
                ),
                iconSize: 22,
                onPressed: () => launchURL(url),
              ),
            ),
          ),
        );
      },
    );
  }
}
