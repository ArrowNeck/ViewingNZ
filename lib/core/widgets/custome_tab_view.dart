import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class CustomTabView extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> pages;

  const CustomTabView({super.key, required this.tabs, required this.pages});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.gray50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TabBar(
                isScrollable: true,
                labelColor: AppColors.white,
                labelStyle: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor: AppColors.gray800,
                dividerColor: Colors.transparent,
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.start,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                tabs: tabs.map((t) => Tab(text: t)).toList(),
              ),
            ),
          ),

          Expanded(child: TabBarView(children: pages)),
        ],
      ),
    );
  }
}
