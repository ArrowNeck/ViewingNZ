import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/confirmation_popup.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/core/widgets/label_wrapper.dart';

class SavedSearchEdit extends StatefulWidget {
  const SavedSearchEdit({super.key, required this.onExitEditView});

  final VoidCallback onExitEditView;

  @override
  State<SavedSearchEdit> createState() => _SavedSearchEditState();
}

class _SavedSearchEditState extends State<SavedSearchEdit> {
  late ValueNotifier<String> selectedFrequency;
  final List<String> notificationFrequencies = ["Instant", "Daily", "None"];

  @override
  void initState() {
    selectedFrequency = ValueNotifier(notificationFrequencies.first);
    super.initState();
  }

  @override
  void dispose() {
    selectedFrequency.dispose();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelWrapper(
            label: "City",
            child: InputField(
              hintText: "Enter city",
              fillColor: AppColors.white,
            ),
          ),
          const Gap(16),
          Text(
            "Residential for Sale",
            style: context.bodyMedium.copyWith(color: AppColors.gray800),
          ),
          Text(
            "Auckland, Auckland City, Auckland Central",
            style: context.bodyMedium.copyWith(color: AppColors.gray800),
          ),
          const Gap(16),
          Text(
            "Notification Frequency",
            style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(8),
          ValueListenableBuilder(
            valueListenable: selectedFrequency,
            builder: (context, selected, child) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: notificationFrequencies.length,
                itemBuilder: (context, index) {
                  final frequency = notificationFrequencies[index];
                  return RadioListTile<String>(
                    value: frequency,
                    groupValue: selected,
                    onChanged: (value) {
                      selectedFrequency.value = value!;
                    },
                    title: Text(frequency, style: context.bodyMedium),
                    contentPadding: EdgeInsets.all(0),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                  );
                },
              );
            },
          ),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    widget.onExitEditView();
                  },
                  child: Text("Cancel"),
                ),
              ),
              const Gap(16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    CoreUtils.heroDialog(
                      ConfirmationPopup(
                        onRightTap: () {
                          widget.onExitEditView();
                          CoreUtils.toastSuccess(
                            "Your saved search has been updated.",
                          );
                        },
                        title: "Update Saved Search",
                        message:
                            "Are you sure want to updated the saved search?",
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
