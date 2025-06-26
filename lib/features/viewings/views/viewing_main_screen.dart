import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/widgets/sliding_segmented_control.dart';

class ViewingMainScreen extends StatefulWidget {
  const ViewingMainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<ViewingMainScreen> createState() => _ViewingMainScreenState();
}

class _ViewingMainScreenState extends State<ViewingMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> segments = [
    "Viewings",
    "Saved Properties",
    "Saved Search",
    "Manage Notifications",
    "My Profile",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: segments.length,
      vsync: this,
      initialIndex: widget.navigationShell.currentIndex,
    );
  }

  @override
  void didUpdateWidget(covariant ViewingMainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    final currentIndex = widget.navigationShell.currentIndex;
    if (_tabController.index != currentIndex) {
      _tabController.animateTo(currentIndex);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SlidingSegmentedControl(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              tabController: _tabController,
              segments: segments,
              onChanged: widget.navigationShell.goBranch,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: widget.navigationShell,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
