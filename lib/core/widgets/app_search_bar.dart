import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputField(
        hintText: "Search here",
        prefixIcon: SolarIconsOutline.magnifier,
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
