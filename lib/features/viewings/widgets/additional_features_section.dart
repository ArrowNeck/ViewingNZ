import 'package:flutter/material.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class AdditionalFeaturesSection extends StatelessWidget {
  const AdditionalFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "Rent Property Additional Features"),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.swimming,
              qty: 1,
              label: "Swimming Pool",
            ),
            AmenityDisplay.withLabel(
              icon: SolarIcons.wifiRouterMinimalistic,
              label: "Wi-Fi Available",
            ),
          ],
        ),
      ],
    );
  }
}
