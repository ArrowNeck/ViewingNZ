import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      actionsPadding: EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        title,
        style: context.headlineSmall.copyWith(color: AppColors.primary),
      ),
      automaticallyImplyLeading: false,
      actions: [
        CustomAvatar(radius: 20, url: "https://i.pravatar.cc/250?img=12"),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
