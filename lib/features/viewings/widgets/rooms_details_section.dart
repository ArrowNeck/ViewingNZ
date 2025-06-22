import 'package:flutter/material.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/amenity_wrap_view.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class RoomsDetailsSection extends StatelessWidget {
  const RoomsDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "Rent Property Rooms Details"),
        AmenityWrapView(
          amenities: [
            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.sleeping,
              qty: 2,
              label: "Bedrooms",
            ),
            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.bath,
              qty: 2,
              label: "Bathrooms",
            ),
            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.shower,
              qty: 2,
              label: "Ensuites",
            ),

            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.toilet,
              qty: 1,
              label: "Separate Toilet",
            ),

            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.sofa,
              qty: 1,
              label: "Living Area",
            ),
            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.laptop,
              qty: 1,
              label: "Study",
            ),
          ],
        ),
      ],
    );
  }
}
