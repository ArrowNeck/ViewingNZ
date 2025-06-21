import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/confirmation_popup.dart';
import 'package:viewing_nz/core/widgets/label_wrapper.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';

class PropertyJourneyStage extends StatefulWidget {
  const PropertyJourneyStage({super.key, required this.onUpdatePressed});

  final VoidCallback onUpdatePressed;

  @override
  State<PropertyJourneyStage> createState() => _PropertyJourneyStageState();
}

class _PropertyJourneyStageState extends State<PropertyJourneyStage> {
  final ExpansibleController _controller = ExpansibleController();
  final ValueNotifier<String?> _selectedStage = ValueNotifier(null);
  final List<String> stages = [
    "Stage 1",
    "Stage 2",
    "Stage 3",
    "Stage 4",
    "Stage 5",
  ];

  @override
  void dispose() {
    _controller.dispose();
    _selectedStage.dispose();
    super.dispose();
  }

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
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary,
            child: SvgIcon(SolarIcons.map, color: AppColors.white),
          ),
          const Gap(12),
          Text(
            "Property Journey Stage ",
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(16),
          LabelWrapper(
            label: "Select Stage",
            child: ValueListenableBuilder(
              valueListenable: _selectedStage,
              builder: (context, value, child) {
                return ExpansionTile(
                  controller: _controller,
                  title: Text(
                    value ?? "Select your preference",
                    style: context.titleMedium.copyWith(
                      color: AppColors.gray800,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: stages
                      .map(
                        (stage) => ListTile(
                          onTap: () {
                            _selectedStage.value = stage;
                            _controller.collapse();
                          },
                          title: Text(
                            stage,
                            style: context.bodyMedium.copyWith(
                              color: AppColors.gray800,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          const Gap(16),
          SubmitButton(
            onPressed: () {
              CoreUtils.heroDialog(
                ConfirmationPopup(
                  onRightTap: () {
                    CoreUtils.toastSuccess(
                      "Your property journey stage has been updated.",
                    );
                    widget.onUpdatePressed();
                  },
                  title: "Update Stage",
                  message:
                      "Are you sure want to updated the property journey stage?",
                  leftBtnText: "No",
                  rightBtnText: "Yes, Updated",
                ),
              );
            },
            text: "Update",
            width: double.maxFinite,
          ),
        ],
      ),
    );
  }
}
