part of 'router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _nestedShellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  // Add redirect logic for authentication
  redirect: (context, state) {
    // Add your authentication logic here
    // final isAuthenticated = AuthService.isLoggedIn();
    // final isOnAuthPage = [Routes.login, Routes.register, '/'].contains(state.uri.path);

    // if (!isAuthenticated && !isOnAuthPage) {
    //   return '/';
    // }
    // if (isAuthenticated && isOnAuthPage) {
    //   return Routes.home;
    // }

    return null; // No redirect needed
  },
  routes: [
    // Root/Auth routes
    GoRoute(path: '/', builder: (_, __) => const SignInScreen()),
    GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) =>
          buildTransitionPage(key: state.pageKey, child: const SignInScreen()),
    ),
    GoRoute(
      path: Routes.register,
      pageBuilder: (context, state) =>
          buildTransitionPage(key: state.pageKey, child: const SignUpScreen()),
    ),

    // Main Bottom Bar Shell Route
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) => buildTransitionPage(
        key: state.pageKey,
        child: NavigationScreen(state: state, child: child),
      ),
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) => buildTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: Routes.chats,
          pageBuilder: (context, state) => buildTransitionPage(
            key: state.pageKey,
            child: const ChatScreen(),
          ),
        ),
        GoRoute(
          path: Routes.notifications,
          pageBuilder: (context, state) => buildTransitionPage(
            key: state.pageKey,
            child: const NotificationScreen(),
          ),
        ),

        // Nested Shell Route for Viewings section
        ShellRoute(
          navigatorKey: _nestedShellNavigatorKey,
          pageBuilder: (context, state, child) => buildTransitionPage(
            key: state.pageKey,
            child: ViewingMainScreen(state: state, child: child),
          ),
          routes: [
            GoRoute(
              path: Routes.viewings,
              pageBuilder: (context, state) => buildTransitionPage(
                key: state.pageKey,
                child: const ViewingsScreen(),
              ),
            ),
            GoRoute(
              path: Routes.savedProperties,
              pageBuilder: (context, state) => buildTransitionPage(
                key: state.pageKey,
                child: const SavedPropertiesScreen(),
              ),
            ),
            GoRoute(
              path: Routes.savedSearch,
              pageBuilder: (context, state) => buildTransitionPage(
                key: state.pageKey,
                child: const SavedSearchScreen(),
              ),
            ),
            GoRoute(
              path: Routes.profile,
              pageBuilder: (context, state) => buildTransitionPage(
                key: state.pageKey,
                child: const MyProfileScreen(),
              ),
            ),
          ],
        ),
      ],
    ),

    // Standalone routes (outside shell navigation)
    GoRoute(
      path: Routes.singleChat,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildTransitionPage(
        key: state.pageKey,
        child: const SingleChatScreenUi(),
      ),
    ),
    GoRoute(
      path: Routes.viewingDetails,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildTransitionPage(
        key: state.pageKey,
        child: const PropertyDetailsScreen(),
      ),
    ),
    GoRoute(
      path: Routes.requestViewing,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildTransitionPage(
        key: state.pageKey,
        child: const RequestViewingScreen(),
      ),
    ),
    GoRoute(
      path: Routes.advancedFilter,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildTransitionPage(
        key: state.pageKey,
        child: const HomeAdvancedFilter(),
      ),
    ),
  ],
);
