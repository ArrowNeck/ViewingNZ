import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class TermsPrivacy extends StatelessWidget {
  const TermsPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "By continuing, you agree to our ",
          style: context.titleMedium.copyWith(color: AppColors.black),
          children: [
            TextSpan(
              text: "\nTerms of Use",
              style: context.titleMedium.copyWith(
                color: AppColors.info500,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: " & ",
              style: context.titleMedium.copyWith(color: AppColors.black),
            ),
            TextSpan(
              text: "Privacy Policy",
              style: context.titleMedium.copyWith(
                color: AppColors.info500,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
