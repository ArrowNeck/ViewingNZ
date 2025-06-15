import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';

class LabelWrapper extends StatelessWidget {
  const LabelWrapper({super.key, required this.label, required this.child});
  final String label;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.titleSmall.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8, width: double.maxFinite),
        child,
      ],
    );
  }
}
