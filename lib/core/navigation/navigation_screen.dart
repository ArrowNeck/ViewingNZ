import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/navigation/navigation_utils.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/global_keys.dart';
import 'package:viewing_nz/core/widgets/main_appbar.dart';
import 'package:viewing_nz/core/widgets/side_panel.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final activeIndex = navigationShell.currentIndex;
    return Scaffold(
      key: GlobalKeys.sidePanelKey,
      appBar: MainAppbar(title: NavigationUtils.getTitle(activeIndex)),
      drawer: SidePanel(),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        unselectedItemColor: AppColors.gray700,
        selectedItemColor: AppColors.primary,
        selectedLabelStyle: context.bodySmall.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: context.bodySmall.copyWith(
          fontWeight: FontWeight.w500,
        ),

        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: NavigationUtils.tabs.mapIndexed((index, tab) {
          return BottomNavigationBarItem(
            icon: _buildBarItem(index, activeIndex, tab.$1),
            label: tab.$2,
          );
        }).toList(),
        onTap: (index) {
          if (index == 4) {
            GlobalKeys.sidePanelKey.currentState?.openDrawer();
          } else {
            navigationShell.goBranch(index);
          }
        },
      ),
    );
  }

  _buildBarItem(int index, int currentIndex, SvgIconData icon) {
    final color = index == currentIndex ? AppColors.primary : AppColors.gray700;
    if (index != 3) {
      return SvgIcon(icon, color: color);
    }
    return Stack(
      children: [
        SvgIcon(icon, color: color),
        Positioned(right: 0, top: 0, child: Badge.count(count: 2)),
      ],
    );
  }
}
