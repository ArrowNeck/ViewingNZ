import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      // progressIndicatorBuilder: (context, url, downloadProgress) => Center(
      //   child: CircularProgressIndicator(value: downloadProgress.progress),
      // ),
      errorWidget: (context, url, error) =>
          Center(child: Icon(SolarIconsOutline.infoCircle)),
    );
  }
}
