import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/res/icons.dart';

import 'package:viewing_nz/core/services/routes.dart';

abstract class NavigationUtils {
  static final icons = [
    (SolarIcons.homeAngle, "Home"),
    (SolarIcons.chatRoundLine, "Chats"),
    (SolarIcons.notebook, "Viewings"),
    (SolarIcons.bell, "Notifications"),
    (SolarIcons.menuDots, "More"),
  ];

  static (int, String) activeIndex(GoRouterState state) {
    return switch (state.fullPath) {
      Routes.home => (0, "Home"),
      Routes.chats => (1, "Chats"),
      Routes.viewings => (2, "Dashboard"),
      Routes.notifications => (3, "Notifications"),
      _ => (0, "Home"),
    };
  }
}
