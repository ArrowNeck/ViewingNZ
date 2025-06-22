import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/widgets/capital_value.dart';
import 'package:viewing_nz/core/widgets/market_insights_header_label.dart';
import 'package:viewing_nz/core/widgets/property_value_chart.dart';
import 'package:viewing_nz/core/widgets/sale_price_range.dart';

class MarketInsightsSection extends StatelessWidget {
  const MarketInsightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(24),
        MarketInsightsHeaderLabel(),
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
