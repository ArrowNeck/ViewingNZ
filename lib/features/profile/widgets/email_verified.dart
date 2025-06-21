import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class EmailVerified extends StatelessWidget {
  const EmailVerified({super.key});

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
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.success,
            child: SvgIcon(SolarIcons.checkCircle, color: AppColors.white),
          ),
          const Gap(16),
          Text(
            "Sahan Lakshitha",
            style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(4),
          Text(
            "Thank you for verifying your email address. ",
            style: context.bodyMedium.copyWith(color: AppColors.gray800),
          ),
          const Gap(4),
          Text(
            "sahan@gmail.com",
            style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
