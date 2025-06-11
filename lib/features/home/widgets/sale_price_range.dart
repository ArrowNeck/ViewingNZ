import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/features/home/widgets/market_insights_label.dart';
import 'package:viewing_nz/features/home/widgets/sale_price_card.dart';

class SalePriceRange extends StatelessWidget {
  const SalePriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarketInsightsLabel(label: "The Estimated Sale Price Range"),
        const Gap(16),
        SizedBox(
          width: double.maxFinite,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 12,
            children: [
              SalePriceCard.estimate(price: 2.51, rangeText: "Low"),
              SalePriceCard.estimate(price: 2.81, rangeText: "Medium"),
              SalePriceCard.estimate(price: 3.22, rangeText: "High"),
            ],
          ),
        ),
      ],
    );
  }
}
