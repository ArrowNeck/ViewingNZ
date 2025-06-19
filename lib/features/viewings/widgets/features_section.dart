import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/features/viewings/widgets/section_label.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "Rent Property Features"),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            AmenityDisplay.withLabel(
              icon: SolarIconsOutline.armchair,
              label: "Fully Furnished",
            ),
            AmenityDisplay.withLabel(
              icon: SolarIconsOutline.washingMachine,
              label: "White Ware",
            ),
          ],
        ),
      ],
    );
  }
}
