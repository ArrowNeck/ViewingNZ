import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({
    super.key,
    required this.title,
    this.topPadding,
    this.bottomPadding,
  });

  const SectionLabel.filter({super.key, required this.title})
    : bottomPadding = 16,
      topPadding = 0;

  final String title;
  final double? topPadding;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        top: topPadding ?? 40,
        bottom: bottomPadding ?? 16,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
