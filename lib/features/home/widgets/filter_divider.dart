import 'package:flutter/material.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class FilterDivider extends StatelessWidget {
  const FilterDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 64, color: AppColors.gray300, thickness: 1);
  }
}
