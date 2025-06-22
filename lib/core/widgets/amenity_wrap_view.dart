import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';

class AmenityWrapView extends StatelessWidget {
  const AmenityWrapView({super.key, required this.amenities});
  final List<AmenityDisplay> amenities;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: amenities
          .map((amenity) => _buildItem(amenity, context))
          .toList(),
    );
  }

  SizedBox _buildItem(AmenityDisplay amenity, BuildContext context) {
    return SizedBox(width: context.screenWidth * .425, child: amenity);
  }
}
