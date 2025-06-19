import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class CustomRangeSlider extends StatelessWidget {
  const CustomRangeSlider({
    super.key,
    required this.values,
    required this.min,
    required this.max,
    required this.stepSize,
    required this.onChanged,
    required this.formatValue,
  });

  final SfRangeValues values;
  final double min;
  final double max;
  final double stepSize;
  final ValueChanged<SfRangeValues> onChanged;
  final String Function(double, String) formatValue;

  @override
  Widget build(BuildContext context) {
    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(
        activeTrackColor: AppColors.gunmetal500,
        inactiveTrackColor: AppColors.gray400,
        thumbColor: AppColors.gunmetal500,
        overlayColor: AppColors.gunmetal500.withAlpha(32),
        tooltipBackgroundColor: AppColors.gunmetal500,
        activeTickColor: AppColors.gunmetal500,
        inactiveTickColor: AppColors.gunmetal500,
        tooltipTextStyle: context.bodySmall.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: SfRangeSlider(
        min: min,
        max: max,
        values: values,
        stepSize: stepSize,
        enableTooltip: true,
        shouldAlwaysShowTooltip: true,
        tooltipShape: SfPaddleTooltipShape(),
        onChanged: onChanged,
        tooltipTextFormatterCallback: (actualValue, formattedText) =>
            formatValue(double.parse(actualValue.toString()), formattedText),
      ),
    );
  }
}
