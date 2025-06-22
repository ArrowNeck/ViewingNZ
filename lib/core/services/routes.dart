class Routes {
  // Auth routes
  static const login = '/login';
  static const register = '/register';

  // Main app routes
  static const home = '/home';
  static const chats = '/chats';
  static const notifications = '/notifications';

  // Properties/Viewings section routes
  static const viewings = '/viewings';
  static const savedProperties = '/saved-properties';
  static const savedSearch = '/saved-search';
  static const profile = '/profile';

  // Standalone routes
  static const singleChat = '/single-chat';
  static const viewingDetails = '/viewing-details';
  static const requestViewing = '/request-a-viewing';
  static const advancedFilter = '/advanced-filter';

  // Route groups for easier management
  static const List<String> authRoutes = [login, register];
  static const List<String> shellRoutes = [
    home,
    chats,
    notifications,
    viewings,
    savedProperties,
    savedSearch,
    profile,
  ];
  static const List<String> standaloneRoutes = [
    singleChat,
    viewingDetails,
    requestViewing,
    advancedFilter,
  ];
}
