import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/confirmation_popup.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';

class SavedSearchCard extends StatelessWidget {
  const SavedSearchCard({super.key, required this.onEditPressed});

  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Auckland City",
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: onEditPressed,
                icon: Icon(SolarIconsOutline.pen2),
                visualDensity: VisualDensity.compact,
              ),
              const Gap(8),
              IconButton(
                onPressed: () {
                  CoreUtils.heroDialog(
                    ConfirmationPopup(
                      onRightTap: () {
                        CoreUtils.toastSuccess("The search has been deleted.");
                      },
                      title: "Delete Saved Search",
                      message: "Are you sure want to delete saved search?",
                      leftBtnText: "No",
                      rightBtnText: "Yes, Delete",
                    ),
                  );
                },
                icon: Icon(SolarIconsOutline.trashBinTrash),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          const Gap(8),
          Text(
            "Residential for Sale",
            style: context.bodyMedium.copyWith(color: AppColors.gray800),
          ),
          Text(
            "Auckland, Auckland City, Auckland Central",
            style: context.bodyMedium.copyWith(color: AppColors.gray800),
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notification Frequency", style: context.bodyMedium),
              Text(
                "Instant",
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(24),
          SubmitButton(text: "View Search Results", onPressed: () {}),
        ],
      ),
    );
  }
}
