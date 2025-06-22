import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onPressed,
  });

  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          minimumSize: const Size(double.infinity, 52),

          side: BorderSide(color: AppColors.gunmetal600),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.gunmetal600,
        ),
        icon: SvgPicture.asset(iconPath),
        label: Text(
          text,
          style: context.titleMedium.copyWith(
            color: AppColors.gunmetal600,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
