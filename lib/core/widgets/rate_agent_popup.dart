import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/confirmation_popup.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/core/widgets/label_wrapper.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';

enum PopupState { rate, confirmation }

class RateAgentPopup extends StatefulWidget {
  const RateAgentPopup({super.key});

  @override
  State<RateAgentPopup> createState() => _ReportPropertyPopupState();
}

class _ReportPropertyPopupState extends State<RateAgentPopup> {
  final TextEditingController _feedbackController = TextEditingController();
  PopupState currentState = PopupState.rate;
  double rating = 0;
  ValueNotifier<PopupState> popupState = ValueNotifier(PopupState.rate);

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _showConfirmationPopup() {
    popupState.value = PopupState.confirmation;
  }

  void _backToRatePopup() {
    popupState.value = PopupState.rate;
  }

  void _confirmRate() {
    // SHOW TOAST MESSAGE HERE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
              builder: (_, state, __) => state == PopupState.rate
                  ? _buildRatePopup()
                  : _buildConfirmationPopup(),
            ),
          ),
        ),
      ),
    );
  }

  _buildConfirmationPopup() {
    return ConfirmationPopup(
      title: "Confirm the Rating",
      message: "Are you sure want to rate the agent?",
      leftBtnText: "No",
      rightBtnText: "Yes, Rate",
      onLeftTap: _backToRatePopup,
      onRightTap: _confirmRate,
      avoidPopInleftButton: true,
    );
  }

  _buildRatePopup() {
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
            "Rate Your Agent",
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const Gap(4),
          Text(
            "Please rate the agent and share your feedback with us.",
            style: context.bodyMedium.copyWith(color: AppColors.gray800),
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          IntrinsicHeight(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const CustomAvatar(
                    radius: 25,
                    url: "https://i.pravatar.cc/250?img=12",
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "James Carter",
                        style: context.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Real Estate Sales Associate",
                        style: context.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          LabelWrapper(
            label: "Rate Here",
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.only(right: 8),
              itemBuilder: (context, _) =>
                  Icon(SolarIconsOutline.star, color: AppColors.rating),
              onRatingUpdate: (rate) {
                rating = rate;
              },
            ),
          ),
          const Gap(16),
          LabelWrapper(
            label: 'Your Feedback',
            child: InputField(
              controller: _feedbackController,
              hintText: "Enter your feedback here",
              maxLines: 3,
              textInputType: TextInputType.multiline,
            ),
          ),
          const Gap(24),
          SubmitButton(onPressed: _showConfirmationPopup, text: "Rate"),
        ],
      ),
    );
  }
}
