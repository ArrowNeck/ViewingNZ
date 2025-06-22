import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/global_keys.dart';

class AmenityDisplay extends StatelessWidget {
  final SvgIconData icon;
  final String? label;
  final int? qty;

  const AmenityDisplay({super.key, required this.icon, this.qty, this.label})
    : assert(
        qty != null || label != null,
        'Either qty, label, or both must be provided.',
      );

  @override
  Widget build(BuildContext context) {
    final style = context.titleSmall.copyWith(
      color: AppColors.gray800,
      fontWeight: FontWeight.w600,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgIcon(icon, color: AppColors.gray800),
        if (qty != null) ...[const Gap(6), Text('$qty', style: style)],
        if (label != null) ...[
          const Gap(6),
          AutoSizeText(
            "$label",
            style: style,
            minFontSize: 10,
            group: GlobalKeys.amenityDisplayGroup,
          ),
        ],
      ],
    );
  }
}
