import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({
    super.key,
    required this.title,
    this.currentDate,
    required this.onCancel,
    required this.onDone,
    this.onValueChanged,
  });

  final String title;
  final DateTime? currentDate;
  final VoidCallback onCancel;
  final ValueChanged<DateTime> onDone;
  final ValueChanged<DateTime>? onValueChanged;

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final ValueNotifier<DateTime> selectedDateNotifier = ValueNotifier(
    DateTime.now(),
  );

  @override
  void initState() {
    super.initState();
    selectedDateNotifier.value = widget.currentDate ?? DateTime.now();
  }

  @override
  void dispose() {
    selectedDateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        ValueListenableBuilder(
          valueListenable: selectedDateNotifier,
          builder: (context, selectedDate, _) {
            return CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                selectedDayHighlightColor: AppColors.primary,
                selectedDayTextStyle: TextStyle(color: AppColors.white),
                todayTextStyle: TextStyle(color: AppColors.primary),
                dayTextStyle: TextStyle(color: AppColors.black),
                disabledDayTextStyle: TextStyle(color: AppColors.gray500),
                weekdayLabelTextStyle: TextStyle(color: AppColors.gunmetal600),
                controlsTextStyle: TextStyle(fontWeight: FontWeight.w600),
                centerAlignModePicker: true,
                firstDayOfWeek: 1,
                weekdayLabelBuilder:
                    ({required weekday, isScrollViewTopHeader}) {
                      final labels = [
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                        'Sun',
                      ];
                      final color = weekday == 6
                          ? AppColors.gray500
                          : weekday == 0
                          ? AppColors.alizarin500
                          : AppColors.gunmetal800;

                      return Center(
                        child: Text(
                          labels[(weekday - 1) % 7],
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
              ),
              value: [selectedDate],
              onValueChanged: (dates) {
                if (dates.isNotEmpty) {
                  selectedDateNotifier.value = dates.first;
                  widget.onValueChanged?.call(dates.first);
                }
              },
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(onPressed: widget.onCancel, child: Text("Cancel")),
            const Gap(16),
            ElevatedButton(
              onPressed: () => widget.onDone(selectedDateNotifier.value),
              child: Text("Done"),
            ),
          ],
        ),
      ],
    );
  }
}
