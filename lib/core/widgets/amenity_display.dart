import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class AmenityDisplay extends StatelessWidget {
  final IconData icon;
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
    final style = context.bodyLarge.copyWith(
      color: AppColors.gray800,
      fontWeight: FontWeight.w600,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.gray800, size: 24),
        const SizedBox(width: 4),
        if (qty != null) Text('$qty', style: style),
        if (label != null) ...[
          const SizedBox(width: 4),
          Text(label!, style: style),
        ],
        const SizedBox(width: 16),
      ],
    );
  }
}
