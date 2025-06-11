import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class TabBarHeader extends StatelessWidget {
  const TabBarHeader({super.key, required this.tabs, this.controller});

  final List<String> tabs;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      // width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TabBar(
        controller: controller,
        isScrollable: true,
        labelColor: AppColors.white,
        labelStyle: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelColor: AppColors.gray800,
        dividerColor: Colors.transparent,
        dividerHeight: 0,
        tabAlignment: TabAlignment.center,
        labelPadding: EdgeInsets.all(0),
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        tabs: tabs
            .map(
              (t) => Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(t),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
