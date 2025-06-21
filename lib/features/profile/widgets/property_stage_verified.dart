import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class PropertyStageVerified extends StatelessWidget {
  const PropertyStageVerified({super.key, required this.onEditPressed});

  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.success,
                  child: SvgIcon(
                    SolarIcons.checkCircle,
                    color: AppColors.white,
                  ),
                ),
                const Gap(16),
                Text(
                  "Property Journey Stage",
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(4),
                Text(
                  "Just Browsing",
                  style: context.bodyMedium.copyWith(color: AppColors.gray800),
                ),
              ],
            ),
          ),
          Positioned(
            top: -8,
            right: -8,
            child: IconButton(
              onPressed: onEditPressed,
              visualDensity: VisualDensity.compact,
              icon: SvgIcon(SolarIcons.pen2),
            ),
          ),
        ],
      ),
    );
  }
}
