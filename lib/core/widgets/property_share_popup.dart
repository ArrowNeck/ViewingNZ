import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class PropertySharePopup extends StatelessWidget {
  const PropertySharePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: context.screenWidth * .9,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(SolarIconsOutline.closeCircle),
                ),
              ),
              const Gap(2),
              Text(
                "Welcome to Viewing NZ",
                style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Gap(28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialIcon(context, "Twitter", AppColors.black),
                  _buildSocialIcon(context, "WhatsApp", AppColors.success400),
                ],
              ),
              const Gap(32),
              ElevatedButton.icon(
                icon: Icon(SolarIconsOutline.link),
                label: Text("Copy Link"),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildSocialIcon(BuildContext context, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: SvgPicture.asset("assets/icons/${label.toLowerCase()}.svg"),
        ),
        const Gap(8),
        Text(
          label,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.gray600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
