import 'package:flutter/material.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class DottedCarouselIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final double dotSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  const DottedCarouselIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.dotSize = 8,
    this.spacing = 6,
    this.activeColor = AppColors.gunmetal700,
    this.inactiveColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(100),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(itemCount, (index) {
            return Container(
              width: dotSize,
              height: dotSize,
              margin: EdgeInsets.symmetric(horizontal: spacing / 2),
              decoration: BoxDecoration(
                color: index == currentIndex ? activeColor : inactiveColor,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),
    );
  }
}
