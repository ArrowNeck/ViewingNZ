import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class SlidingSegmentedControl extends StatefulWidget {
  const SlidingSegmentedControl({
    super.key,
    required this.segments,
    this.tabController,
    this.onChanged,
    this.initialIndex = 0,
    this.padding,
  });

  final List<String> segments;
  final TabController? tabController;
  final ValueChanged<int>? onChanged;
  final int initialIndex;
  final EdgeInsetsGeometry? padding;

  @override
  State<SlidingSegmentedControl> createState() =>
      _SlidingSegmentedControlState();
}

class _SlidingSegmentedControlState extends State<SlidingSegmentedControl>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    if (widget.tabController != null) {
      _tabController = widget.tabController!;
    } else {
      _tabController = TabController(
        length: widget.segments.length,
        vsync: this,
        initialIndex: widget.initialIndex,
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isScrollable = widget.segments.length > 3;
    return Container(
      height: 50,
      width: double.infinity,
      margin: widget.padding,
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: isScrollable,
        labelColor: AppColors.white,
        labelStyle: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelColor: AppColors.gray800,
        dividerColor: Colors.transparent,
        dividerHeight: 0,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: isScrollable ? TabAlignment.start : TabAlignment.fill,
        onTap: widget.onChanged,
        tabs: widget.segments.map((title) {
          return isScrollable
              ? Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Center(child: Text(title)),
                  ),
                )
              : Tab(text: title);
        }).toList(),
      ),
    );
  }
}
