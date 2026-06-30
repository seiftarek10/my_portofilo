import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:seif_portfolio/presentation/sections/contact_section.dart';
import 'package:seif_portfolio/presentation/sections/footer_section.dart';
import 'package:seif_portfolio/presentation/sections/main_grid_section.dart';
import 'package:seif_portfolio/presentation/sections/my_info_section.dart';
import 'package:seif_portfolio/presentation/sections/nav_bar_section.dart';
import 'package:seif_portfolio/presentation/sections/summery_section.dart';
import 'package:seif_portfolio/presentation/sections/system_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _summaryKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _architectureKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isMenuOpen = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 500;
    double textScaleFactor = MediaQuery.of(context).size.width < 500
        ? 0.8
        : 1.0;
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: TextScaler.linear(textScaleFactor)),
      child: Scaffold(
        backgroundColor: const Color(0xFF06090E),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF06090E), Color(0xFF0C111C), Color(0xFF040814)],
            ),
          ),
          child: Stack(
            children: [
              SelectionArea(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 50,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 120),
                        FadeInUp(
                          duration: Duration(milliseconds: 800),
                          child: MyInfoSection(),
                        ),
              
                        FadeInUp(
                          duration: Duration(milliseconds: 800),
                          delay: const Duration(milliseconds: 200),
                          child: Container(
                            key: _summaryKey,
                            child: SummerySection(),
                          ),
                        ),
              
                        FadeInUp(
                          duration: Duration(milliseconds: 800),
                          delay: const Duration(milliseconds: 400),
                          child: MainGridSection(
                            skillsKey: _skillsKey,
                            projectsKey: _projectsKey,
                          ),
                        ),
              
                        FadeInUp(
                          duration: Duration(milliseconds: 800),
                          delay: const Duration(milliseconds: 600),
                          child: Container(
                            key: _architectureKey,
                            child: SystemSection(),
                          ),
                        ),
              
                        FadeInUp(
                          duration: Duration(milliseconds: 800),
                          delay: const Duration(milliseconds: 800),
                          child: Container(
                            key: _contactKey,
                            child: ContactSection(),
                          ),
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 800),
                          delay: const Duration(milliseconds: 1000),
                          child: FooterSection(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              NavBarSection(
                summaryKey: _summaryKey,
                skillsKey: _skillsKey,
                projectsKey: _projectsKey,

                architectureKey: _architectureKey,
                contactKey: _contactKey,
                isMenuOpen: _isMenuOpen,
                onMenuToggle: () {
                  setState(() {
                    _isMenuOpen = !_isMenuOpen;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
