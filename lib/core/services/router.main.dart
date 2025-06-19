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

    GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) =>
          buildTransitionPage(key: state.pageKey, child: SignInScreen()),
    ),
    GoRoute(
      path: Routes.register,
      pageBuilder: (context, state) =>
          buildTransitionPage(key: state.pageKey, child: SignUpScreen()),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) => buildTransitionPage(
        key: state.pageKey,
        child: NavigationScreen(state: state, child: child),
      ),
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) =>
              buildTransitionPage(key: state.pageKey, child: HomeScreen()),
        ),
        GoRoute(
          path: Routes.chats,
          pageBuilder: (context, state) =>
              buildTransitionPage(key: state.pageKey, child: ChatScreen()),
        ),
        GoRoute(
          path: Routes.viewings,
          pageBuilder: (context, state) => buildTransitionPage(
            key: state.pageKey,
            child: ViewingMainScreen(),
          ),
        ),
        GoRoute(
          path: Routes.notifications,
          pageBuilder: (context, state) => buildTransitionPage(
            key: state.pageKey,
            child: NotificationScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: Routes.singleChat,
      pageBuilder: (context, state) =>
          buildTransitionPage(key: state.pageKey, child: SingleChatScreen2()),
    ),
    GoRoute(
      path: Routes.viewingDetails,
      pageBuilder: (context, state) => buildTransitionPage(
        key: state.pageKey,
        child: ViewingDetailsScreen(),
      ),
    ),
    GoRoute(
      path: Routes.requestViewing,
      pageBuilder: (context, state) => buildTransitionPage(
        key: state.pageKey,
        child: RequestViewingScreen(),
      ),
    ),
  ],
);
