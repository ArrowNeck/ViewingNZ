import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/icon_buttons.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/core/widgets/sliding_segmented_control.dart';

class HomeBasicFilter extends StatefulWidget {
  const HomeBasicFilter({super.key});

  @override
  State<HomeBasicFilter> createState() => _HomeBasicFilterState();
}

class _HomeBasicFilterState extends State<HomeBasicFilter> {
  final List<String> segments = ["Buy", "Rent", "Flatmate"];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray300),
      ),
      child: Column(
        children: [
          SlidingSegmentedControl(segments: segments),
          const Gap(16),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: Theme.of(context)
                          .inputDecorationTheme
                          .copyWith(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.gunmetal400,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.gunmetal400,
                              ),
                            ),
                            fillColor: Colors.transparent,
                          ),
                    ),
                    child: InputField(
                      hintText: "Enter city, suburb, or address...",
                      prefixIcon: SolarIconsOutline.magnifier,
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                ),
                const Gap(16),
                IconButtons.icon(
                  icon: SolarIconsOutline.filter,
                  size: 12,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Gap(8),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              RichText(
                text: TextSpan(
                  text: "Search by ",
                  style: context.bodyMedium,
                  children: [
                    TextSpan(
                      text: "Region, City, Suburb",
                      style: context.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "When",
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              Icon(SolarIconsOutline.altArrowDown),
            ],
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              Icon(SolarIconsOutline.altArrowDown),
            ],
          ),
        ],
      ),
    );
  }
}
