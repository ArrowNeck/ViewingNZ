import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/features/viewings/models/open_time.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class OpenHomeTimesSection extends StatelessWidget {
  const OpenHomeTimesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OpenTime> data = [
      OpenTime(date: DateTime(2025, 3, 22), time: "7:30am - 8:00am"),
      OpenTime(date: DateTime(2025, 3, 23), time: "7:30am - 8:00am"),
      OpenTime(date: DateTime(2025, 3, 24), time: "7:30am - 8:00am"),
    ];
    return Column(
      children: [
        SectionLabel(title: "Rent Property Open Home Times"),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (_, index) {
            return _openTimeCard(context, openTime: data[index]);
          },
          separatorBuilder: (_, index) {
            return Gap(12);
          },
        ),
      ],
    );
  }

  _openTimeCard(BuildContext context, {required OpenTime openTime}) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.gray50,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.gunmetal600,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: RichText(
                  text: TextSpan(
                    text: openTime.date.day.toString(),
                    style: context.titleLarge.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: "  ${DateFormat.MMM().format(openTime.date)}",
                        style: context.titleMedium.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.EEEE().format(openTime.date),
                    style: context.bodyLarge,
                  ),
                  Text(openTime.time, style: context.bodyLarge),
                ],
              ),
            ],
          ),
          Divider(height: 32, color: AppColors.gray300),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgIcon(SolarIcons.calendar),
              const Gap(8),
              Text(
                "Add to Calendar",
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
