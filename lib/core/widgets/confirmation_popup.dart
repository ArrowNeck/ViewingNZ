import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class ConfirmationPopup extends StatelessWidget {
  final String title;
  final String message;
  final String leftBtnText;
  final String rightBtnText;
  final VoidCallback? onLeftTap;
  final VoidCallback onRightTap;
  final bool avoidPopInleftButton;

  const ConfirmationPopup({
    super.key,
    this.onLeftTap,
    required this.onRightTap,
    required this.title,
    required this.message,
    required this.leftBtnText,
    required this.rightBtnText,
    this.avoidPopInleftButton = false,
  });

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
                title,
                style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const Gap(4),
              Text(
                message,
                style: context.bodyMedium.copyWith(color: AppColors.gray800),
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        onLeftTap?.call();
                        if (!avoidPopInleftButton) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(leftBtnText),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onRightTap.call();
                        Navigator.pop(context);
                      },
                      child: Text(rightBtnText),
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
