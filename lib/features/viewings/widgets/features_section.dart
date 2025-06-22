import 'package:flutter/material.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/amenity_wrap_view.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "Rent Property Features"),
        AmenityWrapView(
          amenities: [
            AmenityDisplay.withLabel(
              icon: SolarIcons.armchair,
              label: "Fully Furnished",
            ),
            AmenityDisplay.withLabel(
              icon: SolarIcons.washingMachine,
              label: "White Ware",
            ),
          ],
        ),
      ],
    );
  }
}
