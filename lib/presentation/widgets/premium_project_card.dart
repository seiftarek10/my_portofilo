import 'package:flutter/material.dart';
import 'package:seif_portfolio/presentation/widgets/animated_pulse_arrow.dart';

class PremiumProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final Function(String) onLinkPressed;

  const PremiumProjectCard({
    super.key,
    required this.project,
    required this.onLinkPressed,
  });

  @override
  State<PremiumProjectCard> createState() => _PremiumProjectCardState();
}

class _PremiumProjectCardState extends State<PremiumProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        margin: const EdgeInsets.only(bottom: 40),
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.width < 600 ? 20 : 40,
        ),
        decoration: BoxDecoration(
          color: isHovered
              ? const Color(0xFF121B2C).withValues(alpha: 0.8)
              : const Color(0xFF0D131F).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isHovered
                ? const Color(0xFF58A6FF)
                : const Color(0xFF21262D),
            width: isHovered ? 2.5 : 1.5,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF58A6FF).withValues(alpha: 0.2),
                    blurRadius: 40,
                    spreadRadius: 2,
                    offset: const Offset(0, 20),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project["name"],
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: isHovered
                              ? const Color(0xFF58A6FF)
                              : Colors.white,
                          fontFamily: 'Fira Code',
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.project["subtitle"],
                        style: const TextStyle(
                          color: Color(0xFF6366F1),
                          fontFamily: 'Fira Code',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.code_rounded,
                        color: Color(0xFF58A6FF),
                        size: 30,
                      ),
                      onPressed: () =>
                          widget.onLinkPressed(widget.project["github"] ?? ""),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.open_in_new_rounded,
                        color: Color(0xFF10B981),
                        size: 30,
                      ),
                      onPressed: () =>
                          widget.onLinkPressed(widget.project["demo"] ?? ""),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              widget.project["desc"],
              style: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 16,
                height: 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 35),

            const Text(
              "📊 ARCHITECTURE SCREENSHOTS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Fira Code',
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 15),

            if (widget.project["images"] is Map)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (widget.project["images"] as Map<String, dynamic>)
                    .entries
                    .map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, top: 5),
                            child: Text(
                              "• ${entry.key}",
                              style: const TextStyle(
                                color: Color(0xFF58A6FF),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Fira Code',
                              ),
                            ),
                          ),
                          _buildImageListView(entry.value),
                          const SizedBox(height: 15),
                        ],
                      );
                    })
                    .toList(),
              )
            else
              _buildImageListView(widget.project["images"] as List),

            const SizedBox(height: 35),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFF06090E).withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1F293D), width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: (widget.project["metrics"] as Map<String, dynamic>)
                    .entries
                    .map(
                      (metric) => Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              metric.key.toUpperCase(),
                              style: const TextStyle(
                                color: Color(0xFF8B949E),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Fira Code',
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              metric.value,
                              style: const TextStyle(
                                color: Color(0xFF10B981),
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Fira Code',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 35),
            const Divider(color: Color(0xFF21262D), thickness: 1.5),
            const SizedBox(height: 25),

            ...((widget.project["features"] as List<Map<String, dynamic>>).map(
              (feat) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Icon(
                        feat["icon"],
                        color: const Color(0xFF10B981),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        feat["text"],
                        style: const TextStyle(
                          color: Color(0xFFD1D5DB),
                          fontSize: 15.5,
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            const SizedBox(height: 35),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: (widget.project["tags"] as List<String>)
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF06090E),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFF30363D),
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        "#$tag",
                        style: const TextStyle(
                          color: Color(0xFF58A6FF),
                          fontSize: 13,
                          fontFamily: 'Fira Code',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageListView(List images) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 500;
        return SizedBox(
          height: 260,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: images.length,
                itemBuilder: (context, imgIndex) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF30363D),
                        width: 1.5,
                      ),
                      color: const Color(0xFF0D131F),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: AspectRatio(
                      aspectRatio: 7 / 16,
                      child: Image.asset(images[imgIndex], fit: BoxFit.fill),
                    ),
                  );
                },
              ),

              if (isMobile)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: AnimatedPulseArrow(),
                ),
            ],
          ),
        );
      },
    );
  }
}
