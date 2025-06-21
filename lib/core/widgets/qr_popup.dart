import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class QrPopup extends StatelessWidget {
  const QrPopup({super.key});

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
                  child: SvgIcon(SolarIcons.closeCircle),
                ),
              ),
              const Gap(2),
              Text(
                "Your QR for Check-In",
                style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Gap(4),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "You have a viewing at ",
                  style: context.bodyMedium.copyWith(color: AppColors.gray800),
                  children: [
                    TextSpan(
                      text: "32B Dart Place, Fernhill, Queenstown",
                      style: context.bodyMedium.copyWith(
                        color: AppColors.gray800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: " today at "),
                    TextSpan(
                      text: "12:00am.",
                      style: context.bodyMedium.copyWith(
                        color: AppColors.gray800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:
                          " Please download and keep this QR code with you when visiting the property. Thank you!",
                    ),
                  ],
                ),
              ),
              const Gap(24),
              Container(
                width: context.screenWidth * .4,
                height: context.screenWidth * .4,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.gunmetal500, width: 3),
                ),
                child: SvgPicture.asset("assets/icons/qr.svg"),
              ),
              const Gap(32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: Text("Share"),
                      icon: SvgIcon(SolarIcons.share),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: Text("Download"),
                      icon: SvgIcon.white(SolarIcons.downloadMinimalistic),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
