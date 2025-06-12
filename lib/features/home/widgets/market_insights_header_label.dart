import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class MarketInsightsHeaderLabel extends StatelessWidget {
  const MarketInsightsHeaderLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Market ",
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: "Insights",
                style: context.titleLarge.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        const Gap(8),
        Text(
          "Powered by:",
          style: context.bodyMedium.copyWith(color: AppColors.gray800),
        ),
        const Gap(8),
        Image.asset("assets/images/reinz.png"),
      ],
    );
  }
}
