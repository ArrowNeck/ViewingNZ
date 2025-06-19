import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/features/viewings/widgets/section_label.dart';

class RoomsDetailsSection extends StatelessWidget {
  const RoomsDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "Rent Property Rooms Details"),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            AmenityDisplay.withQtyLabel(
              icon: SolarIconsOutline.sleeping,
              qty: 2,
              label: "Bedrooms",
            ),
            AmenityDisplay.withQtyLabel(
              icon: SolarIconsOutline.bath,
              qty: 2,
              label: "Bathrooms",
            ),
            AmenityDisplay.withQtyLabel(
              icon: SolarIconsOutline.broom,
              qty: 2,
              label: "Ensuites",
            ),

            AmenityDisplay.withQtyLabel(
              icon: SolarIconsOutline.userHands,
              qty: 1,
              label: "Separate Toilet",
            ),

            AmenityDisplay.withQtyLabel(
              icon: SolarIconsOutline.sofa,
              qty: 1,
              label: "Living Area",
            ),
            AmenityDisplay.withQtyLabel(
              icon: SolarIconsOutline.notebook,
              qty: 1,
              label: "Study",
            ),
          ],
        ),
      ],
    );
  }
}
