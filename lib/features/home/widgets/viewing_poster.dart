import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/cached_image.dart';

class ViewingPoster extends StatelessWidget {
  const ViewingPoster({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 8 / 7,
        child: CachedImage(url: url),
      ),
    );
  }
}
