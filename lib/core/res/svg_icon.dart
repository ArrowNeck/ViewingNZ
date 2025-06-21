import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class SvgIconData {
  final String path;
  const SvgIconData(this.path);
}

class SvgIcon extends StatelessWidget {
  final SvgIconData icon;
  final double? size;
  final Color? color;

  const SvgIcon(this.icon, {super.key, this.size, this.color});

  const SvgIcon.white(this.icon, {super.key, this.size})
    : color = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon.path,
      width: size ?? 24,
      height: size ?? 24,
      colorFilter: ColorFilter.mode(color ?? AppColors.black, BlendMode.srcIn),
    );
  }
}
