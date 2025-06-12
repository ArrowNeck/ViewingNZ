part of 'router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        return null;
      },
      builder: (_, __) {
        return const SignInScreen();
      },
    ),

    GoRoute(path: Routes.login, builder: (_, state) => const SignInScreen()),
    GoRoute(path: Routes.register, builder: (_, state) => const SignUpScreen()),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return NavigationScreen(state: state, child: child);
      },
      routes: [
        GoRoute(path: Routes.home, builder: (_, state) => const HomeScreen()),
        GoRoute(path: Routes.chats, builder: (_, state) => const ChatScreen()),
        GoRoute(
          path: Routes.notifications,
          builder: (_, state) => const NotificationScreen(),
        ),
      ],
    ),
    GoRoute(
      path: Routes.singleChat,
      builder: (_, state) => const SingleChatScreen(),
    ),
    GoRoute(
      path: Routes.viewingDetails,
      builder: (_, state) => const ViewingDetails(),
    ),
    GoRoute(
      path: Routes.requestViewing,
      builder: (_, state) => const RequestViewingScreen(),
    ),
  ],
);
