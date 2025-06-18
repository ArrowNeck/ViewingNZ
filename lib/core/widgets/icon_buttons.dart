import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class IconButtons extends StatelessWidget {
  const IconButtons.icon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.fillColor,
    this.height,
  }) : label = null;
  const IconButtons.label({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.fillColor,
    this.height,
  });

  final IconData icon;
  final String? label;
  final VoidCallback onPressed;
  final Color? fillColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.gunmetal600),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.gunmetal600),
            if (label != null) ...[
              const Gap(12),
              Text(
                label!,
                style: context.bodyLarge.copyWith(
                  color: AppColors.gunmetal600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
