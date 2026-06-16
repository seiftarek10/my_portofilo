import 'package:flutter/material.dart';
import 'package:seif_portfolio/data/portfolio_data.dart';
import 'package:seif_portfolio/data/url_launcher.dart';
import 'package:seif_portfolio/presentation/sections/header_section.dart';
import 'package:seif_portfolio/presentation/widgets/fly_in_animation.dart';
import 'package:seif_portfolio/presentation/widgets/interactive_skill_card.dart';
import 'package:seif_portfolio/presentation/widgets/premium_project_card.dart';

class MainGridSection extends StatelessWidget {
  const MainGridSection({super.key, required this.skillsKey, required this.projectsKey});
  final GlobalKey skillsKey, projectsKey;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 950;

        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(key: skillsKey, child: _buildSkillsPanel()),
                    const SizedBox(height: 40),
                    Container(key: projectsKey, child: _buildProjectsPanel()),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        key: projectsKey,
                        child: _buildProjectsPanel(),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 5,
                      child: Container(
                        key: skillsKey,
                        child: _buildSkillsPanel(),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildSkillsPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(title: "⚡ CORE_SKILLSET_MATRICES"),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: PortfolioData.structuredSkills.length,
          itemBuilder: (context, index) {
            final skill = PortfolioData.structuredSkills[index];
            return FlyInAnimation(
              fromLeft: false,
              child: InteractiveSkillCard(skill: skill),
            );
          },
        ),
      ],
    );
  }

  Widget _buildProjectsPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(title: "📂 CAPTAIN_PRODUCTION_WORK"),
        ...PortfolioData.projects.map(
          (project) => FlyInAnimation(
            fromLeft: true,
            child: PremiumProjectCard(
              project: project,
              onLinkPressed: launchURL,
            ),
          ),
        ),
      ],
    );
  }
}
