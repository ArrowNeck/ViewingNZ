import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/icon_buttons.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class MapViewSection extends StatefulWidget {
  const MapViewSection({super.key});

  @override
  State<MapViewSection> createState() => _MapViewSectionState();
}

class _MapViewSectionState extends State<MapViewSection> {
  final LatLng location = LatLng(-45.031162, 168.662643);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(top: 40, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionLabel(
                title: "Rent Property Map View",
                topPadding: 0,
                bottomPadding: 0,
              ),
              IconButtons.icon(
                onPressed: () {},
                icon: SolarIconsOutline.routing2,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: AspectRatio(
            aspectRatio: .9,
            child: ColoredBox(color: AppColors.gray50),
            // GoogleMap(
            //   initialCameraPosition: CameraPosition(target: location, zoom: 14),
            //   markers: {
            //     Marker(
            //       markerId: MarkerId('property_location'),
            //       position: location,
            //     ),
            //   },
            //   onMapCreated: (GoogleMapController controller) {
            //     // Optional controller logic
            //   },
            // ),
          ),
        ),
      ],
    );
  }
}
