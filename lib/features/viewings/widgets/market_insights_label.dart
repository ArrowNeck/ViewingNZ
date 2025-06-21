import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';

class MarketInsightsLabel extends StatelessWidget {
  const MarketInsightsLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const Gap(8),
        SvgIcon(SolarIcons.infoCircle, size: 16),
      ],
    );
  }
}
