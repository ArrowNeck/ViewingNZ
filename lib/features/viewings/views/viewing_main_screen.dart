import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/sliding_segmented_control.dart';
import 'package:viewing_nz/features/viewings/views/saved_properties_screen.dart';
import 'package:viewing_nz/features/profile/views/my_profile_screen.dart';
import 'package:viewing_nz/features/saved_search/views/saved_search_screen.dart';
import 'package:viewing_nz/features/viewings/views/viewings_screen.dart';

class ViewingMainScreen extends StatefulWidget {
  const ViewingMainScreen({super.key});

  @override
  State<ViewingMainScreen> createState() => _ViewingMainScreenState();
}

class _ViewingMainScreenState extends State<ViewingMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingSegmentedControl(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          segments: [
            "Viewings",
            "Saved Properties",
            "Saved Search",
            "My Profile",
          ],
          children: [
            ViewingsScreen(),
            SavedPropertiesScreen(),
            SavedSearchScreen(),
            MyProfileScreen(),
          ],
        ),
      ),
    );
  }
}
