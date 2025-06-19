import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';

class PriceAndAddress extends StatelessWidget {
  const PriceAndAddress({
    super.key,
    required this.price,
    required this.address,
  });

  final String price;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          price,
          style: context.bodyLarge.copyWith(fontWeight: FontWeight.w700),
        ),
        Gap.expand(1),
        Text(address, style: context.bodyMedium),
      ],
    );
  }
}
