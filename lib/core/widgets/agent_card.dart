import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CustomAvatar(
            radius: 48,
            url:
                "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250",
          ),
          const Gap(12),
          Text(
            "James Carter",
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(2),
          Text("Real Estate Sales Associate", style: context.bodyMedium),
          const Gap(12),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IgnorePointer(
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: AppColors.rating),
                    onRatingUpdate: (rating) {},
                  ),
                ),
                const Gap(8),
                Text(
                  "4.9",
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                VerticalDivider(color: AppColors.gray300, width: 24),
                Text("Reviews : ", style: context.bodyMedium),
                Text(
                  "45",
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Active Listings",
                style: context.bodyMedium.copyWith(color: AppColors.gray800),
              ),
              Text(
                "3",
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              Text(
                "www.vatero.com",
                style: context.bodyMedium.copyWith(color: AppColors.info500),
              ),
              const Gap(8),
              Icon(
                SolarIconsOutline.squareTopDown,
                color: AppColors.info500,
                size: 15,
              ),
              const Spacer(),
              Image.asset("assets/images/vatero.png"),
            ],
          ),
          Divider(color: AppColors.gray300, height: 24),

          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text("Call"),
                  icon: Icon(SolarIconsOutline.phoneRounded, size: 24),
                ),
              ),
              const Gap(12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text("Email"),
                  icon: Icon(SolarIconsOutline.letter, size: 24),
                ),
              ),
            ],
          ),
          const Gap(12),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text("Chat"),
            icon: Icon(SolarIconsOutline.chatRoundLine, size: 24),
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(double.maxFinite, 48)),
            ),
          ),
          const Gap(12),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(double.maxFinite, 48)),
            ),
            child: Text("View All Listings"),
          ),
        ],
      ),
    );
  }
}
