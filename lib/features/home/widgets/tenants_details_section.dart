import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/features/home/widgets/section_label.dart';

class TenantsDetailsSection extends StatelessWidget {
  const TenantsDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "Rent Property Tenants Details"),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            AmenityDisplay.withLabel(
              icon: SolarIconsOutline.cat,
              label: "Pets Allowed",
            ),
            AmenityDisplay.withLabel(
              icon: SolarIconsOutline.fire,
              label: "Smoking Allowed",
            ),
          ],
        ),
        _tenantsNotes(context, "Maximum Number: 2"),
        _tenantsNotes(context, "Suitable For: "),
      ],
    );
  }

  _tenantsNotes(BuildContext context, String note) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        note,
        style: context.bodyLarge.copyWith(
          color: AppColors.gray800,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
