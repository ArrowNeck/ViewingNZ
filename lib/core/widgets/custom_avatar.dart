import 'package:flutter/material.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/cached_image.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key, required this.radius, required this.url});

  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.alizarin50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedImage(url: url),
      ),
    );
  }
}
