import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final SvgIconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.gunmetal600,
            radius: 24,
            child: SvgIcon(icon, color: AppColors.white),
          ),
          const Gap(16),
          Text(
            title,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(description, style: context.titleSmall),
        ],
      ),
    );
  }
}
