import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/custome_tab_view.dart';
import 'package:viewing_nz/features/home/views/saved_properties_screen.dart';
import 'package:viewing_nz/features/profile/views/my_profile_screen.dart';
import 'package:viewing_nz/features/saved_search/views/saved_search_screen.dart';
import 'package:viewing_nz/features/viewings/views/viewings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomTabView(
          tabs: ["Viewings", "Saved Properties", "Saved Search", "My Profile"],
          pages: [
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
