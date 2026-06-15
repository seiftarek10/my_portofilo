import 'package:flutter/material.dart';

class InteractiveSkillCard extends StatefulWidget {
  final Map<String, dynamic> skill;
  const InteractiveSkillCard({super.key, required this.skill});

  @override
  State<InteractiveSkillCard> createState() => _InteractiveSkillCardState();
}

class _InteractiveSkillCardState extends State<InteractiveSkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 40), 
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF1E293B).withValues( alpha:  0.6) : const Color(0xFF161B22).withValues(alpha:  0.4),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isHovered ? widget.skill["color"] : const Color(0xFF21262D),
            width: isHovered ? 2.0 : 1.5,
          ),
          boxShadow: isHovered ? [BoxShadow(color: (widget.skill["color"] as Color).withValues(alpha:  0.25), blurRadius: 25)] : [],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (widget.skill["color"] as Color).withValues(alpha:  0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(widget.skill["icon"], color: widget.skill["color"], size: 28),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.skill["name"], 
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 17, fontFamily: 'Fira Code'),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.skill["desc"], 
                    style: const TextStyle(color: Color(0xFF8B949E), fontSize: 13, height: 1.5, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}