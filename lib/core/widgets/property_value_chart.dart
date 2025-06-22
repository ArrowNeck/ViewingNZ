import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/features/viewings/models/property_chart_model.dart';
import 'package:viewing_nz/core/widgets/market_insights_label.dart';

class PropertyValueChart extends StatefulWidget {
  const PropertyValueChart({super.key});

  @override
  State<PropertyValueChart> createState() => _PropertyValueChartState();
}

class _PropertyValueChartState extends State<PropertyValueChart> {
  PropertyChartModel propertyModel = PropertyChartModel(
    propertyName: "32B Dart Place, Fernhill",
    propertyColor: AppColors.alizarin200,
    comparisorName: "Suburb Median",
    comparisorColor: AppColors.gunmetal200,
    data: [
      ChartData(
        month: "Mar 24",
        propertyValue: 120000,
        comparisorValue: 110000,
      ),
      ChartData(
        month: "Apr 24",
        propertyValue: 150000,
        comparisorValue: 135000,
      ),
      ChartData(
        month: "May 24",
        propertyValue: 140000,
        comparisorValue: 120000,
      ),
      ChartData(
        month: "Jun 24",
        propertyValue: 250000,
        comparisorValue: 200000,
      ),
      ChartData(
        month: "Jul 24",
        propertyValue: 100000,
        comparisorValue: 100000,
      ),
    ],
  );

  double get minValue {
    final allValues = propertyModel.data
        .expand((point) => [point.propertyValue, point.comparisorValue])
        .toList();
    return allValues.reduce((a, b) => a < b ? a : b) * 0.9;
  }

  double get maxValue {
    final allValues = propertyModel.data
        .expand((point) => [point.propertyValue, point.comparisorValue])
        .toList();
    return allValues.reduce((a, b) => a > b ? a : b) * 1.1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarketInsightsLabel(
          label: "Estimated Sale Price Over the Last 12 Months",
        ),

        const Gap(4),
        Text(
          "These estimates are computer generated and are guides only. For more information on this property, please contact an agent.",
          style: context.bodyMedium.copyWith(color: AppColors.gray800),
        ),
        const Gap(12),
        AspectRatio(
          aspectRatio: 1,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval:
                    (maxValue - minValue) / propertyModel.data.length,
                getDrawingHorizontalLine: (value) {
                  return FlLine(color: AppColors.gray100, strokeWidth: 1);
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 1,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      int index = value.toInt();

                      if (index < 0 || index >= propertyModel.data.length) {
                        return const SizedBox.shrink();
                      }

                      return SideTitleWidget(
                        meta: meta,
                        fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
                        child: Text(
                          propertyModel.data[index].month,
                          style: context.bodyMedium,
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: propertyModel.data.length - 1,
              minY: minValue,
              maxY: maxValue,
              lineBarsData: [
                LineChartBarData(
                  spots: propertyModel.data
                      .asMap()
                      .entries
                      .map(
                        (entry) => FlSpot(
                          entry.key.toDouble(),
                          entry.value.propertyValue,
                        ),
                      )
                      .toList(),
                  isCurved: true,
                  curveSmoothness: 0.3,
                  color: propertyModel.propertyColor,
                  barWidth: 4,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: propertyModel.propertyColor.withAlpha(64),
                  ),
                ),

                LineChartBarData(
                  spots: propertyModel.data
                      .asMap()
                      .entries
                      .map(
                        (entry) => FlSpot(
                          entry.key.toDouble(),
                          entry.value.comparisorValue,
                        ),
                      )
                      .toList(),
                  isCurved: true,
                  curveSmoothness: 0.3,
                  color: propertyModel.comparisorColor,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: propertyModel.comparisorColor.withAlpha(64),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(
              color: propertyModel.propertyColor,
              label: propertyModel.propertyName,
            ),
            const Gap(16),
            _buildLegendItem(
              color: propertyModel.comparisorColor,
              label: propertyModel.comparisorName,
            ),
          ],
        ),
      ],
    );
  }

  _buildLegendItem({required Color color, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const Gap(4),
        Text(label, style: context.bodyMedium),
      ],
    );
  }
}
