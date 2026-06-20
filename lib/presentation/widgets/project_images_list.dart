import 'package:flutter/material.dart';
import 'package:seif_portfolio/presentation/widgets/animated_pulse_arrow.dart';

class ImageListViewWithAutoHidingArrow extends StatefulWidget {
  final List images;
  const ImageListViewWithAutoHidingArrow({super.key, required this.images});

  @override
  State<ImageListViewWithAutoHidingArrow> createState() =>
      _ImageListViewState();
}

class _ImageListViewState extends State<ImageListViewWithAutoHidingArrow> {
  bool _showArrow = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              setState(() {
                if (notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent) {
                  _showArrow = false;
                } else {
                  _showArrow = true;
                }
              });
              return true;
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.images.length,
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraints) {
                  bool isMobile = constraints.maxWidth < 768;
                  return SizedBox(
                    height: 260,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.images.length,
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
                                child: Image.asset(
                                  widget.images[imgIndex],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),

                        if (isMobile)
                          IgnorePointer(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: AnimatedPulseArrow(),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // 2. إظهار السهم بناءً على الحالة
          if (_showArrow)
            const IgnorePointer(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: AnimatedPulseArrow(),
              ),
            ),
        ],
      ),
    );
  }
}
