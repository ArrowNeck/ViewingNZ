import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => context.push(Routes.singleChat),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: const CustomAvatar(
                radius: 24,
                url: "https://i.pravatar.cc/250?img=12",
              ),
            ),
            Expanded(
              child: Text(
                "James Carter",
                style: context.titleMedium.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "23 Mar",
                  style: context.titleMedium.copyWith(color: AppColors.black),
                ),
                Badge.count(count: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
