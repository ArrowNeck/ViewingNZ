import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAvatar(
                  radius: 40,
                  url: "https://i.pravatar.cc/250?img=12",
                ),
                const Gap(12),
                Text(
                  "Sahan Lakshitha",
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(4),
                Text("sahan@gmail.com", style: context.bodyMedium),
              ],
            ),
          ),
          Positioned(
            top: -8,
            right: -8,
            child: IconButton(
              onPressed: () {},
              visualDensity: VisualDensity.compact,
              icon: SvgIcon(SolarIcons.pen2),
            ),
          ),
        ],
      ),
    );
  }
}
