import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:viewing_nz/core/extensions/formatting_extension.dart';
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

class _RequestFilterState extends State<RequestFilter> {
  final List<String> _listingTypes = [
    "Rent",
    "Sale",
    "House",
    "Apartment / Flat",
    "Villa",
    "Bungalow",
  ];
  final List<String> _timeOfDay = ["Morning", "Afternoon", "Evening"];
  final _dateFormatter = DateFormat("dd-MMM-yyyy");

  final ValueNotifier<DateTime?> _fromDate = ValueNotifier(null);
  final ValueNotifier<DateTime?> _toDate = ValueNotifier(null);

  final ValueNotifier<String?> _selectedType = ValueNotifier(null);
  final ValueNotifier<List<String?>> _selectedTimeOfDay = ValueNotifier([]);

  final ValueNotifier<SfRangeValues> _currentRange = ValueNotifier(
    SfRangeValues(6.0, 18.0),
  );

  final ValueNotifier<bool> _showDatePicker = ValueNotifier(false);
  bool _isFrom = true;

  @override
  void dispose() {
    _showDatePicker.dispose();
    _fromDate.dispose();
    _toDate.dispose();
    _selectedType.dispose();
    _selectedTimeOfDay.dispose();
    _currentRange.dispose();
    super.dispose();
  }

  void _showCustomDatePicker() {
    _showDatePicker.value = true;
  }

  void _hideDatePicker() {
    _showDatePicker.value = false;
  }

  void _resetAll() {
    _fromDate.value = null;
    _toDate.value = null;
    _selectedTimeOfDay.value = [];
    _selectedType.value = null;
    _currentRange.value = SfRangeValues(6.0, 18.0);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: _showDatePicker,
            builder: (_, state, _) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: FadeTransition(opacity: animation, child: child),
                ),
                child: state ? _buildCalendarView() : _buildFilterView(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarView() {
    return CalendarView(
      title: "${_isFrom ? "From" : "To"} Date",
      onCancel: _hideDatePicker,
      onDone: (pickedDate) {
        if (_isFrom) {
          _fromDate.value = pickedDate;
        } else {
          _toDate.value = pickedDate;
        }
        _hideDatePicker();
      },
      avoidPopWhenButtonsPressed: true,
    );
  }

  Widget _buildFilterView() {
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
              _buildDateField(true, _fromDate),
              const Gap(16),
              _buildDateField(false, _toDate),
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

          CustomWrapperBuilder(notifier: _selectedTimeOfDay, items: _timeOfDay),
          const Gap(16),
          LabelWrapper(
            label: "Listing Type",
            child: ValueListenableBuilder(
              valueListenable: _selectedType,
              builder: (context, type, child) {
                return AnimatedDropMenu(
                  items: _listingTypes,
                  selected: type ?? "Select property type",
                  onChanged: (type) {
                    _selectedType.value = type;
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
      ),
    );
  }

  Widget _buildDateField(bool isFrom, ValueNotifier<DateTime?> date) {
    return Expanded(
      child: LabelWrapper(
        label: "${isFrom ? "From" : "To"} Date",
        child: GestureDetector(
          onTap: () => {_isFrom = isFrom, _showCustomDatePicker()},
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
                          ? _dateFormatter.format(date.value!)
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
