import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/custome_tab_view.dart';
import 'package:viewing_nz/features/home/views/saved_properties.dart';
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
            SavedProperties(),
            Container(color: Colors.transparent),
            Container(color: Colors.transparent),
          ],
        ),
      ),
    );
  }
}
