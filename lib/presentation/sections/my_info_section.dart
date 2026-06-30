import 'package:flutter/material.dart';
import 'package:seif_portfolio/data/portfolio_data.dart';

class MyInfoSection extends StatelessWidget {
  const MyInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
       double screenWidth = MediaQuery.of(context).size.width;
    bool isMobileLayout = screenWidth < 1100;

    double imageSize = isMobileLayout ? 250 : 420;
    double nameFontSize = isMobileLayout ? 40 : 76;

    Widget heroContent = Column(
      crossAxisAlignment: isMobileLayout
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF10B981).withValues(alpha: 0.4),
              width: 1.5,
            ),
          ),
          child: const Text(
            "⚡ ARCHITECTURE MATRIX ACTIVE",
            style: TextStyle(
              color: Color(0xFF10B981),
              fontFamily: 'Fira Code',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 35),
        Center(
          child: Text(
            PortfolioData.name,
            textAlign: isMobileLayout ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontFamily: 'Fira Code',
              fontSize: nameFontSize,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 6.0,
              shadows: const [
                Shadow(
                  color: Color(0xFF58A6FF),
                  offset: Offset(0, 4),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          PortfolioData.title,
          textAlign: isMobileLayout ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            fontFamily: 'Fira Code',
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Color(0xFF58A6FF),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          PortfolioData.subtitle,
          textAlign: isMobileLayout ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            fontFamily: 'Fira Code',
            fontSize: 16,
            color: Color(0xFF8B949E),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

    Widget heroImage = Center(
      child: Container(
        width: imageSize,
        height: imageSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF161B22).withValues(alpha: 0.3),
          border: Border.all(color: const Color(0xFF21262D), width: 1.5),
        ),
        child: ClipOval(
          child: Image.asset(
            PortfolioData.profileImagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.person_outline_rounded,
                size: 120,
                color: Color(0xFF30363D),
              );
            },
          ),
        ),
      ),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: isMobileLayout ? 40 : 80, top: 20),
      child: isMobileLayout
          ? Column(
              children: [heroImage, const SizedBox(height: 40), heroContent],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 6, child: heroContent),
                Expanded(flex: 4, child: heroImage),
              ],
            ),
    );
  }
}

 
  