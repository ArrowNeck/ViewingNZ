import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';

import 'package:viewing_nz/core/services/routes.dart';

abstract class NavigationUtils {
  static final icons = [
    (SolarIconsOutline.homeAngle, "Home"),
    (SolarIconsOutline.chatRoundLine, "Chats"),
    (SolarIconsOutline.notebook, "Viewings"),
    (SolarIconsOutline.bell, "Notifications"),
    (SolarIconsOutline.menuDots, "More"),
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
