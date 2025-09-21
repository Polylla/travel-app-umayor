import 'dart:async';

import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final double height;
  final Duration autoPlayInterval;
  final bool autoPlay;
  final bool showArrows;

  const ImageCarousel({
    super.key,
    required this.images,
    this.height = 220,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlay = true,
    this.showArrows = true,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final PageController _ctrl;
  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController(viewportFraction: 0.92);
    if (widget.autoPlay && widget.images.length > 1) {
      _timer = Timer.periodic(
        widget.autoPlayInterval,
        (_) => _toPage(_index + 1),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  void _toPage(int newIndex) {
    if (!mounted) return;
    final count = widget.images.length;
    final next = (newIndex) % count;
    setState(() => _index = next);
    _ctrl.animateToPage(
      next,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  Widget build(BuildContext context) {
    if (widget.images.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            controller: _ctrl,
            onPageChanged: (i) => setState(() => _index = i),
            itemCount: widget.images.length,
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(widget.images[i], fit: BoxFit.cover),
              ),
            ),
          ),
          if (widget.showArrows)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _circleBtn(
                      Icons.keyboard_arrow_up,
                      () => _toPage(_index - 1),
                    ),
                    const SizedBox(height: 8),
                    _circleBtn(
                      Icons.keyboard_arrow_down,
                      () => _toPage(_index + 1),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (i) {
                final selected = i == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 8,
                  width: selected ? 16 : 8,
                  decoration: BoxDecoration(
                    color: selected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) => Material(
    color: Colors.white,
    shape: const CircleBorder(),
    elevation: 2,
    child: InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, size: 22),
      ),
    ),
  );
}
