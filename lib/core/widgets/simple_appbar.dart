import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
