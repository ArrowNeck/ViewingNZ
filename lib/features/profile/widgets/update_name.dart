import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/confirmation_popup.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/core/widgets/label_wrapper.dart';

class UpdateName extends StatelessWidget {
  const UpdateName({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary,
            child: SvgIcon(SolarIcons.user, color: AppColors.white),
          ),
          const Gap(12),
          Text(
            "Name",
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(16),
          LabelWrapper(
            label: "Name",
            child: InputField(
              hintText: "Enter Name",
              fillColor: AppColors.white,
            ),
          ),
          const Gap(16),
          LabelWrapper(
            label: "Nickname",
            child: InputField(
              hintText: "Enter nickname",
              fillColor: AppColors.white,
            ),
          ),
          const Gap(24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(onPressed: () {}, child: Text("Cancel")),
              ),
              const Gap(16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    CoreUtils.heroDialog(
                      ConfirmationPopup(
                        onRightTap: () {
                          CoreUtils.toastSuccess("Your name has been updated.");
                        },
                        title: "Update Name",
                        message: "Are you sure want to updated the name?",
                        leftBtnText: "No",
                        rightBtnText: "Yes, Updated",
                      ),
                    );
                  },
                  child: Text("Update"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
