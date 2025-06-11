import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/tab_bar_header.dart';

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
            child: TabBarHeader(tabs: tabs),
          ),
          Expanded(child: TabBarView(children: pages)),
        ],
      ),
    );
  }
}
