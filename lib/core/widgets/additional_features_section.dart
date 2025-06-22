import 'package:flutter/material.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/amenity_wrap_view.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class AdditionalFeaturesSection extends StatelessWidget {
  const AdditionalFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionLabel(title: "Rent Property Additional Features"),
        AmenityWrapView(
          amenities: [
            AmenityDisplay(
              icon: SolarIcons.swimming,
              qty: 1,
              label: "Swimming Pool",
            ),
            AmenityDisplay(
              icon: SolarIcons.wifiRouterMinimalistic,
              label: "Wi-Fi Available",
            ),
          ],
        ),
      ],
    );
  }
}
