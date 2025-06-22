import 'dart:convert';

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

  // Image toute paths (without hardcoded query values)
  static const imageListViewPath = '/image-view/list/:refId';
  static const imageFullScreenPath = '/image-view/full-screen/:index';

  // Static methods for complex routes
  static String imageListView(int refId, int index, List<String> images) {
    final encodedImages = Uri.encodeComponent(jsonEncode(images));
    return '/image-view/list/$refId?index=$index&images=$encodedImages';
  }

  static String imageFullScreen(int index, List<String> images) {
    final encodedImages = Uri.encodeComponent(jsonEncode(images));
    return '/image-view/full-screen/$index?images=$encodedImages';
  }
}
