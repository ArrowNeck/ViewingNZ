part of 'router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

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
    GoRoute(path: '/', builder: (_, _) => const SignInScreen()),
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

    // Main Shell Route for Bottom Navigation (StatefulShellRoute)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationScreen(navigationShell: navigationShell);
      },
      branches: [
        // Branch 0: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              pageBuilder: (context, state) => buildTransitionPage(
                key: state.pageKey,
                child: const HomeScreen(),
              ),
            ),
          ],
        ),

        // Branch 1: Chats
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.chats,
              pageBuilder: (context, state) => buildTransitionPage(
                key: state.pageKey,
                child: const ChatScreen(),
              ),
            ),
          ],
        ),

        // Branch 2: Viewing Section (Nested StatefulShellRoute)
        StatefulShellBranch(
          routes: [
            StatefulShellRoute.indexedStack(
              builder: (context, state, nestedNavigationShell) {
                return ViewingMainScreen(
                  navigationShell: nestedNavigationShell,
                );
              },
              branches: [
                // Nested Branch 0: Viewings
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: Routes.viewings,
                      pageBuilder: (context, state) => buildTransitionPage(
                        key: state.pageKey,
                        child: const ViewingsScreen(),
                      ),
                    ),
                  ],
                ),

                // Nested Branch 1: Saved Properties
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: Routes.savedProperties,
                      pageBuilder: (context, state) => buildTransitionPage(
                        key: state.pageKey,
                        child: const SavedPropertiesScreen(),
                      ),
                    ),
                  ],
                ),

                // Nested Branch 2: Saved Search
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: Routes.savedSearch,
                      pageBuilder: (context, state) => buildTransitionPage(
                        key: state.pageKey,
                        child: const SavedSearchScreen(),
                      ),
                    ),
                  ],
                ),

                // Nested Branch 3: Manage Notification
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: Routes.manageNotification,
                      pageBuilder: (context, state) => buildTransitionPage(
                        key: state.pageKey,
                        child: const ManageNotificationScreen(),
                      ),
                    ),
                  ],
                ),

                // Nested Branch 4: Profile
                StatefulShellBranch(
                  routes: [
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
          ],
        ),

        // Branch 3: Notifications
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notifications,
              pageBuilder: (context, state) => buildTransitionPage(
                key: state.pageKey,
                child: const NotificationScreen(),
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

    // Image view routes (outside shell navigation)
    GoRoute(
      path: Routes.imageListViewPath, // '/image-view/list/:refId'
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) {
        final refId = int.tryParse(state.pathParameters['refId'] ?? '') ?? 0;
        final index =
            int.tryParse(state.uri.queryParameters['index'] ?? '0') ?? 0;
        final encodedImages = state.uri.queryParameters['images'] ?? '[]';
        final images = List<String>.from(
          jsonDecode(Uri.decodeComponent(encodedImages)),
        );

        return buildTransitionPage(
          key: state.pageKey,
          child: ImageListView(
            refId: refId,
            initialIndex: index,
            images: images,
          ),
        );
      },
    ),

    GoRoute(
      path: Routes.imageFullScreenPath, // '/image-view/full-screen/:index'
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) {
        final index = int.tryParse(state.pathParameters['index'] ?? '0') ?? 0;
        final encodedImages = state.uri.queryParameters['images'] ?? '[]';
        final images = List<String>.from(
          jsonDecode(Uri.decodeComponent(encodedImages)),
        );

        return buildTransitionPage(
          key: state.pageKey,
          child: FullScreenImageView(initialIndex: index, images: images),
        );
      },
    ),
  ],
);
