import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class ProfileCompletion extends StatelessWidget {
  const ProfileCompletion({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile Completion",
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Almost there! 2 of 3 Steps Done",
              style: context.bodyMedium.copyWith(color: AppColors.gray800),
            ),
          ],
        ),
      ),
    );
  }
}
