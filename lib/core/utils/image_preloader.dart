import 'package:flutter/material.dart';

class ImagePreloader {
  static void preloadImages(List<String> imageUrls, BuildContext context) {
    for (final url in imageUrls) {
      precacheImage(NetworkImage(url), context);
    }
  }
}
