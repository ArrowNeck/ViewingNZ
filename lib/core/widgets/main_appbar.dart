import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Viewing NZ",
            style: context.headlineSmall.copyWith(color: AppColors.primary),
          ),
          Text(
            "Simplify Your Property Journey",
            style: context.bodySmall.copyWith(color: AppColors.gray800),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(SolarIconsOutline.hamburgerMenu, color: AppColors.black),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
