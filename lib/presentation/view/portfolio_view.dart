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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 768;
    double textScaleFactor = MediaQuery.of(context).size.width < 768
        ? 0.8
        : 1.0;
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: TextScaler.linear(textScaleFactor)),
      child: Scaffold(
        backgroundColor: const Color(0xFF06090E),
        // إضافة الـ endDrawer عشان يفتح من اليمين
        endDrawer: Drawer(
          backgroundColor: const Color(0xFF0D1117),
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                    "SEIF TARIQ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  "Summary",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  Navigator.pop(context),
                  _scrollToSection(_summaryKey),
                },
              ),
              ListTile(
                title: const Text(
                  "Projects",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  Navigator.pop(context),
                  _scrollToSection(_projectsKey),
                },
              ),
              ListTile(
                title: const Text(
                  "Skills",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  Navigator.pop(context),
                  _scrollToSection(_skillsKey),
                },
              ),
              ListTile(
                title: const Text(
                  "Systems",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  Navigator.pop(context),
                  _scrollToSection(_architectureKey),
                },
              ),
              ListTile(
                title: const Text(
                  "Contact",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {
                  Navigator.pop(context),
                  _scrollToSection(_contactKey),
                },
              ),
            ],
          ),
        ),
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
                        MyInfoSection(),

                        Container(key: _summaryKey, child: SummerySection()),
                        MainGridSection(
                          skillsKey: _skillsKey,
                          projectsKey: _projectsKey,
                        ),
                        Container(
                          key: _architectureKey,
                          child: SystemSection(),
                        ),
                        Container(key: _contactKey, child: ContactSection()),

                        FooterSection(),
                      ],
                    ),
                  ),
                ),
              ),
              NavBarSection(
                summaryKey: _summaryKey,
                projectsKey: _projectsKey,
                skillsKey: _skillsKey,
                architectureKey: _architectureKey,
                contactKey: _contactKey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }}
}
