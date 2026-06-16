import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Import للـ Data والـ Widgets حسب مسار مشروعك
import '../../data/portfolio_data.dart';
import '../widgets/fly_in_animation.dart';
import '../widgets/interactive_skill_card.dart';
import '../widgets/premium_project_card.dart';

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

  Future<void> _launchURL(String urlString) async {
    if (urlString.isEmpty) return;
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $urlString');
    }
  }

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

  Widget _buildSectionHeader(String title) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth < 600 ? 24 : 36;

        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          alignment: Alignment.centerLeft,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Fira Code',
                    letterSpacing: 2,
                    color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-3, -3),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xFF58A6FF),
                        Color(0xFF6366F1),
                      ],
                    ).createShader(bounds),
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: fontSize, // حجم خط متغير
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Fira Code',
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                        _buildPremiumHeroSection(),

                        Container(
                          key: _summaryKey,
                          child: _buildSummarySection(),
                        ),
                        _buildMainGridContext(),
                        Container(
                          key: _architectureKey,
                          child: _buildExtraArchitecturalSections(),
                        ),
                        Container(
                          key: _contactKey,
                          child: _buildContactMeSection(),
                        ),

                        _buildPremiumFooter(),
                      ],
                    ),
                  ),
                ),
              ),
              _buildStickyNavbar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStickyNavbar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80,
        // قللنا الـ padding شوية عشان توفر مساحة
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
                fontSize: 20, // صغرتها سيكا عشان توفر مكان
                letterSpacing: 2,
              ),
            ),
            const SizedBox(width: 20),

            // هنا الحل: Expanded + SingleChildScrollView أفقي
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildNavButton("Summary", _summaryKey),
                    _buildNavButton("Projects", _projectsKey),
                    _buildNavButton("Skills", _skillsKey),
                    _buildNavButton("Systems", _architectureKey),
                    _buildNavButton("Contact", _contactKey),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),
            // الأيقونات
            Row(
              children: [
                _buildSocialIconButton(
                  icon: Icons.code_rounded,
                  tooltip: "GitHub",
                  url: "https://github.com/seiftarek10",
                  hoverColor: const Color(0xFF58A6FF),
                ),
                const SizedBox(width: 10),
                _buildSocialIconButton(
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

  Widget _buildSocialIconButton({
    required IconData icon,
    required String tooltip,
    required String url,
    required Color hoverColor,
  }) {
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
                onPressed: () => _launchURL(url),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPremiumHeroSection() {
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
        Text(
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

  WidgetSpan _buildBoldWhiteWord(String word) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Text(
        word,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Fira Code',
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    final TextStyle normalStyle = const TextStyle(
      fontSize: 16,
      fontFamily: 'Fira Code',
      height: 1.8,
      fontWeight: FontWeight.w500,
      color: Color(0xFF8B949E),
    );

    return FlyInAnimation(
      fromLeft: true,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFF30363D), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Professional Summary"),
            const SizedBox(height: 5),
            const Divider(color: Color(0xFF30363D), thickness: 1.5),
            const SizedBox(height: 25),
            RichText(
              text: TextSpan(
                style: normalStyle,
                children: [
                  const TextSpan(text: "I am a professional "),
                  _buildBoldWhiteWord("Flutter Developer"),
                  const TextSpan(
                    text:
                        " specialized in elite enterprise mobile application systems execution. My engineering philosophy revolves around unyielding implementation of ",
                  ),
                  _buildBoldWhiteWord("Clean Architecture boundaries"),
                  const TextSpan(text: ", rigid "),
                  _buildBoldWhiteWord("SOLID design principles"),
                  const TextSpan(text: ", and writing production-grade, "),
                  _buildBoldWhiteWord("zero-leak reactive Dart systems"),
                  const TextSpan(
                    text:
                        ". I don't just build cross-platform apps that run; I architect robust mobile ecosystems engineered for massive concurrency, ",
                  ),
                  _buildBoldWhiteWord("multi-role multi-tenant architectures"),
                  const TextSpan(
                    text:
                        ", and secure financial gateway communication pipelines. Through deep mastery of advanced state automation like Rhine-level ",
                  ),
                  _buildBoldWhiteWord("BLoC/Cubit"),
                  const TextSpan(
                    text:
                        " and custom native integrations, I bridge the gap between heavy enterprise backend capabilities and ultra-fluid, reactive client interfaces.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget _buildMainGridContext() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 950;

        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // التعديل: المهارات بقت هي اللي فوق في الموبايل
                    Container(key: _skillsKey, child: _buildSkillsPanel()),
                    const SizedBox(height: 40),
                    Container(key: _projectsKey, child: _buildProjectsPanel()),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        key: _projectsKey,
                        child: _buildProjectsPanel(),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 5,
                      child: Container(
                        key: _skillsKey,
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
        _buildSectionHeader("⚡ CORE_SKILLSET_MATRICES"),
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
        _buildSectionHeader("📂 CAPTAIN_PRODUCTION_WORK"),
        ...PortfolioData.projects.map(
          (project) => FlyInAnimation(
            fromLeft: true,
            child: PremiumProjectCard(
              project: project,
              onLinkPressed: _launchURL,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExtraArchitecturalSections() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("🛠️ CORE APPLICATION SYSTEMS MATRIX"),
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
          _buildSectionHeader("🚀 DEPLOYMENT SYSTEMS ENGINE"),
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

  Widget _buildContactMeSection() {
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
          _buildSectionHeader("📞 CONTACT ME"),
          const SizedBox(height: 20),
          Wrap(
            spacing: 30,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: PortfolioData.contactLinks
                .map(
                  (info) => InkWell(
                    onTap: () => _launchURL(info["url"] ?? ""),
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

  Widget _buildPremiumFooter() {
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
