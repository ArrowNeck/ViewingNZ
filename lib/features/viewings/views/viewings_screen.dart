import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/features/viewings/widgets/request_card.dart';
import 'package:viewing_nz/features/viewings/widgets/viewing_header.dart';

class ViewingsScreen extends StatefulWidget {
  const ViewingsScreen({super.key});

  @override
  State<ViewingsScreen> createState() => _ViewingsScreenState();
}

class _ViewingsScreenState extends State<ViewingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ViewingHeader(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputField(
                hintText: "Search here",
                prefixIcon: SolarIconsOutline.magnifier,
                textInputAction: TextInputAction.search,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (_, index) => RequestCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
