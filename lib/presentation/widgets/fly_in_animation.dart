import 'package:flutter/material.dart';

class FlyInAnimation extends StatelessWidget {
  final Widget child;
  final bool fromLeft;

  const FlyInAnimation({super.key, required this.child, required this.fromLeft});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1100),
      curve: Curves.easeOutCubic,
      builder: (context, value, childWidget) {
        double offset = (1 - value) * (fromLeft ? -200 : 200);
        return Transform.translate(
          offset: Offset(offset, 0),
          child: Opacity(
            opacity: value,
            child: childWidget,
          ),
        );
      },
      child: child,
    );
  }
}