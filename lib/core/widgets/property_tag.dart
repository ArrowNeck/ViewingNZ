import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class PropertyTag extends StatelessWidget {
  const PropertyTag({
    super.key,
    required this.name,
    required this.fontColor,
    required this.fillColor,
  });

  const PropertyTag.dark({super.key, required this.name})
    : fontColor = AppColors.white,
      fillColor = AppColors.gunmetal600;

  const PropertyTag.light({super.key, required this.name})
    : fontColor = AppColors.gunmetal600,
      fillColor = AppColors.white;

  final String name;
  final Color fontColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        name,
        style: context.titleSmall.copyWith(
          color: fontColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
