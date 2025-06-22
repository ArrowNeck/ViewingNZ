import 'package:flutter/material.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/amenity_wrap_view.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class ParkingDetailsSection extends StatelessWidget {
  const ParkingDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "Rent Property Parking Details"),
        AmenityWrapView(
          amenities: [
            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.car,
              qty: 1,
              label: "Garaged",
            ),
            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.garage,
              qty: 2,
              label: "Covered",
            ),
            AmenityDisplay.withQtyLabel(
              icon: SolarIcons.bus,
              qty: 2,
              label: "Other",
            ),
          ],
        ),
      ],
    );
  }
}
