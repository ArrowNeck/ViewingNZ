import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/widgets/sliding_segmented_control.dart';

class ViewingMainScreen extends StatefulWidget {
  const ViewingMainScreen({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<ViewingMainScreen> createState() => _ViewingMainScreenState();
}

class _ViewingMainScreenState extends State<ViewingMainScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  final List<String> segments = [
    "Viewings",
    "Saved Properties",
    "Saved Search",
    "My Profile",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: segments.length,
      vsync: this,
      initialIndex: activeIndex(widget.state),
    );
  }

  @override
  void didUpdateWidget(covariant ViewingMainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    final currentIndex = activeIndex(widget.state);
    if (_tabController.index != currentIndex) {
      _tabController.index = currentIndex;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  int activeIndex(GoRouterState state) {
    return switch (state.fullPath) {
      Routes.viewings => 0,
      Routes.savedProperties => 1,
      Routes.savedSearch => 2,
      Routes.profile => 3,
      _ => 0,
    };
  }

  void onChanged(int index) {
    switch (index) {
      case 0:
        context.go(Routes.viewings);
      case 1:
        context.go(Routes.savedProperties);
      case 2:
        context.go(Routes.savedSearch);
      case 3:
        context.go(Routes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SlidingSegmentedControl(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              tabController: _tabController,
              segments: segments,
              onChanged: onChanged,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
