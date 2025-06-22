import 'package:viewing_nz/core/services/routes.dart';

extension RouteExtensions on String {
  bool get isAuthRoute => Routes.authRoutes.contains(this);
  bool get isShellRoute => Routes.shellRoutes.contains(this);
  bool get isStandaloneRoute => Routes.standaloneRoutes.contains(this);
}
