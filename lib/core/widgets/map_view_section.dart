import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/widgets/icon_buttons.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class MapViewSection extends StatefulWidget {
  const MapViewSection({super.key});

  @override
  State<MapViewSection> createState() => _MapViewSectionState();
}

class _MapViewSectionState extends State<MapViewSection> {
  GoogleMapController? mapController;
  static const LatLng location = LatLng(-36.8485, 174.7633);

  static const CameraPosition _position = CameraPosition(
    target: location,
    zoom: 12.0,
  );

  Set<Marker> _markers = {};
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  Future<void> _loadCustomMarker() async {
    try {
      markerIcon = await BitmapDescriptor.asset(
        ImageConfiguration(size: Size(30, 36)),
        'assets/images/map_marker.png',
      );
    } catch (e) {
      debugPrint('Error loading custom marker: $e');
      markerIcon = BitmapDescriptor.defaultMarker;
    }

    setState(() {
      _markers = {
        Marker(
          markerId: MarkerId('auckland'),
          position: location,
          icon: markerIcon,
        ),
      };
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionLabel(
                title: "Rent Property Map View",
                topPadding: 0,
                bottomPadding: 0,
              ),
              IconButtons.icon(onPressed: () {}, icon: SolarIcons.routing2),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: AspectRatio(
            aspectRatio: .9,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _position,
              markers: _markers,
              mapType: MapType.normal,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
            ),
          ),
        ),
      ],
    );
  }
}
