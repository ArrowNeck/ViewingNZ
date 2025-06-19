import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/utils/validators.dart';
import 'package:viewing_nz/core/widgets/confirmation_popup.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/core/widgets/label_wrapper.dart';
import 'package:viewing_nz/core/widgets/simple_appbar.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';
import 'package:viewing_nz/features/viewings/widgets/date_time_drop_menu.dart';

class RequestViewingScreen extends StatefulWidget {
  const RequestViewingScreen({super.key});

  @override
  State<RequestViewingScreen> createState() => _RequestViewingScreenState();
}

class _RequestViewingScreenState extends State<RequestViewingScreen> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isCustomInputSelect = ValueNotifier(false);
  String? selectedDate;
  String? selectedTime;

  void _changeCustomDataTimeInput(bool value) {
    isCustomInputSelect.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(title: "Requesting a Viewing"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Gap(8),
                    LabelWrapper(
                      label: 'Name',
                      child: InputField(
                        hintText: "Sahan Akash",
                        textInputType: TextInputType.name,
                        validator: Validators.name,
                      ),
                    ),

                    const Gap(16),
                    LabelWrapper(
                      label: 'Email',
                      child: InputField(
                        hintText: "sahan@gmail.com",
                        textInputType: TextInputType.emailAddress,
                        validator: Validators.email,
                      ),
                    ),

                    const Gap(16),
                    LabelWrapper(
                      label: 'Phone',
                      child: InputField(
                        hintText: "+64 275 555 58",
                        textInputType: TextInputType.phone,
                        validator: Validators.mobileNumber,
                      ),
                    ),

                    const Gap(16),
                    LabelWrapper(
                      label: 'Available Timing',
                      child: DateTimeDropMenu(
                        onChange: _changeCustomDataTimeInput,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: isCustomInputSelect,
                      builder: (_, state, __) {
                        return state
                            ? Column(
                                children: [
                                  const Gap(16),
                                  LabelWrapper(
                                    label: 'Preffered Date',
                                    child: _prefferedWidget(
                                      () {},
                                      selectedDate ?? "Select date",
                                      SolarIconsOutline.calendar,
                                    ),
                                  ),

                                  const Gap(16),
                                  LabelWrapper(
                                    label: 'Preffered Time',
                                    child: _prefferedWidget(
                                      () {},
                                      selectedTime ?? "Select time",
                                      SolarIconsOutline.clockCircle,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink();
                      },
                    ),
                    const Gap(16),
                    LabelWrapper(
                      label: 'Your Message',
                      child: InputField(
                        hintText: "Enter your message here",
                        maxLines: 3,
                        textInputType: TextInputType.multiline,
                      ),
                    ),

                    const Gap(24),
                    SubmitButton(
                      onPressed: () => CoreUtils.heroDialog(
                        ConfirmationPopup(
                          title: "Confirm the Viewing",
                          message: "Are you sure want to initiate the viewing?",
                          leftBtnText: "No",
                          rightBtnText: "Yes, Initiate",
                          onRightTap: () {},
                        ),
                      ),
                      text: "Initiate Request",
                    ),
                    const Gap(8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _prefferedWidget(VoidCallback onTap, String value, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.gray50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                value,
                style: context.bodyMedium.copyWith(color: AppColors.gray800),
              ),
            ),
            const Gap(8),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
