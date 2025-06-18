import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';

class SavedSearchHeader extends StatelessWidget {
  const SavedSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Saved Search",
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(SolarIconsOutline.filter, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
