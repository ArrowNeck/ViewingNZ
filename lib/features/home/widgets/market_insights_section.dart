import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/features/home/widgets/capital_value.dart';
import 'package:viewing_nz/features/home/widgets/property_value_chart.dart';
import 'package:viewing_nz/features/home/widgets/sale_price_range.dart';

class MarketInsightsSection extends StatelessWidget {
  const MarketInsightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(24),
        SalePriceRange(),
        const Gap(16),
        CapitalValue(),
        const Gap(32),
        PropertyValueChart(),
      ],
    );
  }
}
