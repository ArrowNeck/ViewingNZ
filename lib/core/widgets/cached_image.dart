import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;

  const CachedImage({super.key, required this.url, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          // color: AppColors.gray100,
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),
      memCacheWidth: 1200,
      memCacheHeight: 1200,
      cacheKey: url,
      fadeInDuration: Duration(milliseconds: 50),
      fadeOutDuration: Duration(milliseconds: 50),
      maxWidthDiskCache: 1500,
      maxHeightDiskCache: 1500,
      placeholder: (context, url) => Container(
        color: AppColors.gray100,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: AppColors.gray100,
        child: Center(
          child: SvgIcon(
            SolarIcons.infoCircle,
            color: AppColors.primary,
            size: 48,
          ),
        ),
      ),
    );
  }
}
