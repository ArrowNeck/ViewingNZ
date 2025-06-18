import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/animated_drop_menu.dart';
import 'package:viewing_nz/core/widgets/confirmation_popup.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';

enum PopupState { reportProperty, confirmation }

class ReportPropertyPopup extends StatefulWidget {
  const ReportPropertyPopup({super.key});

  @override
  State<ReportPropertyPopup> createState() => _ReportPropertyPopupState();
}

class _ReportPropertyPopupState extends State<ReportPropertyPopup> {
  final List<String> reportReasons = [
    "Incorrect Information",
    "Duplicate Listing",
    "Scam or Fraud",
    "Inappropriate Content",
    "Property Already Sold or Rented",
    "Fake Images",
    "Wrong Location",
    "Contact Not Responding",
    "Price Too Low to Be Real",
    "Other",
  ];

  ValueNotifier<String> selectedReason = ValueNotifier("Select a reason");

  ValueNotifier<PopupState> popupState = ValueNotifier(
    PopupState.reportProperty,
  );

  void _showConfirmationPopup() {
    popupState.value = PopupState.confirmation;
  }

  void _backToReportPopup() {
    popupState.value = PopupState.reportProperty;
  }

  void _confirmReport() {
    CoreUtils.toastSuccess("Property has been reported.");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    ),
                child: child,
              );
            },
            child: ValueListenableBuilder(
              valueListenable: popupState,
              builder: (_, state, __) => state == PopupState.reportProperty
                  ? _buildReportPropertyPopup()
                  : _buildConfirmationPopup(),
            ),
          ),
        ),
      ),
    );
  }

  _buildConfirmationPopup() {
    return ConfirmationPopup(
      title: "Confirm the Report",
      message: "Are you sure want to report the property?",
      leftBtnText: "No",
      rightBtnText: "Yes, Report",
      onLeftTap: _backToReportPopup,
      onRightTap: _confirmReport,
      avoidPopInleftButton: true,
    );
  }

  _buildReportPropertyPopup() {
    return Container(
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
            "Report Property",
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const Gap(4),
          Text(
            "Please specify the reason to report this property.",
            style: context.bodyMedium.copyWith(color: AppColors.gray800),
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          ValueListenableBuilder(
            valueListenable: selectedReason,
            builder: (context, reason, child) {
              return AnimatedDropMenu(
                items: reportReasons,
                selected: reason,
                onChanged: (value) => selectedReason.value = value,
              );
            },
          ),
          const Gap(32),
          ValueListenableBuilder(
            valueListenable: selectedReason,
            builder: (context, reason, child) {
              return SubmitButton(
                onPressed: reason != "Select a reason"
                    ? _showConfirmationPopup
                    : null,
                text: "Continue",
              );
            },
          ),
        ],
      ),
    );
  }
}
