import 'package:flutter/material.dart';

class AnimatedPulseArrow extends StatefulWidget {
  const AnimatedPulseArrow({super.key});

  @override
  State<AnimatedPulseArrow> createState() => _AnimatedPulseArrowState();
}

class _AnimatedPulseArrowState extends State<AnimatedPulseArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // 1. تعريف الـ Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          // color: Color.fromARGB(187, 20, 37, 74),
          color: Color.fromARGB(226, 109, 25, 19),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
