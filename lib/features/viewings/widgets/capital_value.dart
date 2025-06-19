import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/features/viewings/widgets/market_insights_label.dart';
import 'package:viewing_nz/features/viewings/widgets/sale_price_card.dart';

class CapitalValue extends StatelessWidget {
  const CapitalValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarketInsightsLabel(label: "Capital Value"),
        const Gap(16),
        SizedBox(
          width: double.maxFinite,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 12,
            children: [
              SalePriceCard.capital(
                price: 2.51,
                rangeText: "Updated 01 Jun 21",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
