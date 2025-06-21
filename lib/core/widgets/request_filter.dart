import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:viewing_nz/core/extensions/formatting_extension.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/animated_drop_menu.dart';
import 'package:viewing_nz/core/widgets/calendar_view.dart';
import 'package:viewing_nz/core/widgets/custom_range_slider.dart';
import 'package:viewing_nz/core/widgets/custom_wrapper_builder.dart';
import 'package:viewing_nz/core/widgets/label_wrapper.dart';

class RequestFilter extends StatefulWidget {
  final VoidCallback onFindResults;

  const RequestFilter({super.key, required this.onFindResults});

  @override
  State<RequestFilter> createState() => _RequestFilterState();
}

class _RequestFilterState extends State<RequestFilter>
    with TickerProviderStateMixin {
  final List<String> listingTypes = [
    "Rent",
    "Sale",
    "House",
    "Apartment / Flat",
    "Villa",
    "Bungalow",
  ];

  final List<String> timeOfDay = ["Morning", "Afternoon", "Evening"];

  final dateFormatter = DateFormat("dd-MMM-yyyy");
  ValueNotifier<DateTime?> fromDate = ValueNotifier(null);
  ValueNotifier<DateTime?> toDate = ValueNotifier(null);

  ValueNotifier<String?> selectedType = ValueNotifier(null);
  ValueNotifier<List<String?>> selectedTimeOfDay = ValueNotifier([]);

  final ValueNotifier<SfRangeValues> _currentRange = ValueNotifier(
    SfRangeValues(6.0, 18.0),
  );

  late AnimationController _popupAnimationController;
  late AnimationController _datePickerAnimationController;
  late Animation<double> _popupScaleAnimation;
  late Animation<double> _popupOpacityAnimation;
  late Animation<double> _datePickerSlideAnimation;
  late Animation<double> _datePickerOpacityAnimation;

  final ValueNotifier<bool> _showDatePicker = ValueNotifier(false);
  bool isFromDatePicker = true;

  @override
  void initState() {
    super.initState();

    _popupAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _popupScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _popupAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _popupOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _popupAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _datePickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _datePickerSlideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _datePickerAnimationController,
        curve: Curves.easeInOutCubic,
      ),
    );

    _datePickerOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _datePickerAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _popupAnimationController.forward();
  }

  @override
  void dispose() {
    _popupAnimationController.dispose();
    _datePickerAnimationController.dispose();
    _showDatePicker.dispose();
    fromDate.dispose();
    toDate.dispose();
    selectedType.dispose();
    selectedTimeOfDay.dispose();
    _currentRange.dispose();
    super.dispose();
  }

  void _showCustomDatePicker() async {
    await _popupAnimationController.reverse();
    _showDatePicker.value = true;
    await _datePickerAnimationController.forward();
  }

  void _hideDatePicker() async {
    await _datePickerAnimationController.reverse();
    _showDatePicker.value = false;
    await _popupAnimationController.forward();
  }

  void _resetAll() {
    fromDate.value = null;
    toDate.value = null;
    selectedTimeOfDay.value = [];
    selectedType.value = "Select property type";
    _currentRange.value = SfRangeValues(8.0, 18.0);
  }

  void _closePopup() async {
    await _popupAnimationController.reverse();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ValueListenableBuilder<bool>(
        valueListenable: _showDatePicker,
        builder: (context, showDatePicker, child) {
          return Stack(
            children: [
              if (!showDatePicker)
                AnimatedBuilder(
                  animation: _popupAnimationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _popupOpacityAnimation.value,
                      child: Transform.scale(
                        scale: _popupScaleAnimation.value,
                        child: Center(
                          child: Container(
                            width: context.screenWidth * .9,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(50),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: _buildPopupContent(),
                          ),
                        ),
                      ),
                    );
                  },
                ),

              if (showDatePicker)
                AnimatedBuilder(
                  animation: _datePickerAnimationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _datePickerOpacityAnimation.value,
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          _datePickerSlideAnimation.value *
                              context.screenHeight,
                        ),
                        child: Center(
                          child: Container(
                            width: context.screenWidth * .9,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(50),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: CalendarView(
                              title: "${isFromDatePicker ? "From" : "To"} Date",
                              onCancel: _hideDatePicker,
                              onDone: (pickedDate) {
                                if (isFromDatePicker) {
                                  fromDate.value = pickedDate;
                                } else {
                                  toDate.value = pickedDate;
                                }
                                _hideDatePicker();
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPopupContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: _closePopup,
            child: SvgIcon(SolarIcons.closeCircle),
          ),
        ),
        const Gap(2),
        Text(
          "Filter",
          style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const Gap(16),
        Row(
          children: [
            _buildDatePicker(true, fromDate),
            const Gap(16),
            _buildDatePicker(false, toDate),
          ],
        ),
        const Gap(16),
        LabelWrapper(
          label: "Time",
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: ValueListenableBuilder(
              valueListenable: _currentRange,
              builder: (context, values, child) {
                return CustomRangeSlider(
                  values: values,
                  min: 6.0,
                  max: 18.0,
                  stepSize: 1 / 12,
                  onChanged: (SfRangeValues values) {
                    _currentRange.value = values;
                  },
                  formatValue: (actualValue, formattedText) {
                    return actualValue.toFormattedTime();
                  },
                );
              },
            ),
          ),
        ),

        CustomWrapperBuilder(notifier: selectedTimeOfDay, items: timeOfDay),
        const Gap(16),
        LabelWrapper(
          label: "Listing Type",
          child: ValueListenableBuilder(
            valueListenable: selectedType,
            builder: (context, type, child) {
              return AnimatedDropMenu(
                items: listingTypes,
                selected: selectedType.value ?? "Select property type",
                onChanged: (type) {
                  selectedType.value = type;
                },
              );
            },
          ),
        ),
        const Gap(24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _resetAll,
                child: Text("Reset All"),
              ),
            ),
            const Gap(16),
            Expanded(
              child: ElevatedButton(
                onPressed: widget.onFindResults,
                child: Text("Find Results"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDatePicker(bool isFrom, ValueNotifier<DateTime?> date) {
    return Expanded(
      child: LabelWrapper(
        label: "${isFrom ? "From" : "To"} Date",
        child: GestureDetector(
          onTap: () => {isFromDatePicker = isFrom, _showCustomDatePicker()},
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.gray50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                  valueListenable: date,
                  builder: (context, value, child) {
                    return Text(
                      date.value != null
                          ? dateFormatter.format(date.value!)
                          : "Select date",
                      style: context.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray800,
                      ),
                    );
                  },
                ),
                SvgIcon(SolarIcons.calendar, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
