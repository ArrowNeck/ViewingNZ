import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/navigation/navigation_utils.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/main_appbar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final activeIndex = NavigationUtils.activeIndex(state);
    return Scaffold(
      appBar: MainAppbar(),
      body: child,
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
        items: NavigationUtils.icons.mapIndexed((index, item) {
          return BottomNavigationBarItem(
            icon: _buildBarItem(index, item.$1),
            label: item.$2,
          );
        }).toList(),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(Routes.home);
            case 1:
              context.go(Routes.chats);
            case 2:
              context.go(Routes.home);
            case 3:
              context.go(Routes.notifications);
          }
        },
      ),
    );
  }

  _buildBarItem(int index, IconData icon) {
    if (index != 3) {
      return Icon(icon);
    }
    return Stack(
      children: [
        Icon(icon),
        Positioned(right: 0, top: 0, child: Badge.count(count: 2)),
      ],
    );
  }
}
