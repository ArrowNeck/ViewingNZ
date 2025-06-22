import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

final amenityDisplayGroup = AutoSizeGroup();

class AmenityDisplay extends StatelessWidget {
  final SvgIconData icon;
  final String? label;
  final int? qty;

  const AmenityDisplay.withQty({
    super.key,
    required this.icon,
    required this.qty,
  }) : label = null;

  const AmenityDisplay.withLabel({
    super.key,
    required this.icon,
    required this.label,
  }) : qty = null;

  const AmenityDisplay.withQtyLabel({
    super.key,
    required this.icon,
    required this.qty,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final style = context.titleSmall.copyWith(
      color: AppColors.gray800,
      fontWeight: FontWeight.w600,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgIcon(icon, color: AppColors.gray800, size: 22),
        const SizedBox(width: 6),
        if (qty != null) Text('$qty', style: style),
        if (label != null) ...[
          const SizedBox(width: 6),
          AutoSizeText(
            label!,
            style: style,
            minFontSize: 10,
            group: amenityDisplayGroup,
          ),
        ],
        const SizedBox(width: 16),
      ],
    );
  }
}
