import 'package:viewing_nz/core/res/icons.dart';

abstract class NavigationUtils {
  static final tabs = [
    (SolarIcons.homeAngle, "Home"),
    (SolarIcons.chatRoundLine, "Chats"),
    (SolarIcons.notebook, "Viewings"),
    (SolarIcons.bell, "Notifications"),
    (SolarIcons.menuDots, "More"),
  ];

  // static (int, String) activeIndex(GoRouterState state) {
  //   return switch (state.fullPath) {
  //     Routes.home => (0, "Home"),
  //     Routes.chats => (1, "Chats"),
  //     Routes.viewings ||
  //     Routes.savedProperties ||
  //     Routes.savedSearch ||
  //     Routes.profile => (2, "Dashboard"),
  //     Routes.notifications => (3, "Notifications"),
  //     _ => (0, "Home"),
  //   };
  // }

  static String getTitle(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Chats";
      case 2:
        return "Dashboard";
      case 3:
        return "Notifications";
      default:
        return "Home";
    }
  }
}
