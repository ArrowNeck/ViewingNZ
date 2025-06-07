import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/icon_buttons.dart';
import 'package:viewing_nz/core/widgets/simple_appbar.dart';
import 'package:viewing_nz/features/home/widgets/listed_and_ref_id.dart';
import 'package:viewing_nz/features/home/widgets/price_and_address.dart';
import 'package:viewing_nz/features/home/widgets/viewing_poster.dart';

class ViewingDetails extends StatefulWidget {
  const ViewingDetails({super.key});

  @override
  State<ViewingDetails> createState() => _ViewingDetailsState();
}

class _ViewingDetailsState extends State<ViewingDetails> {
  final List<String> titles = [
    "Price Updates",
    "Open Home Times",
    "Map View",
    "Property Details",
    "Rooms Details",
    "Parking Details",
    "Additional Features",
    "Tenants Details",
    "Market Insights",
    "Contact the Agents",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(title: "Details View"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          ViewingPoster(
            url:
                "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
          ),
          const Gap(16),
          ListedAndRefId.withTag(date: "12 Mar", refId: 2345, tag: "Rent"),
          const Gap(12),
          PriceAndAddress(
            price: "USD 4,595,000.00",
            address: "32B Dart Place, Fernhill, Queenstown",
          ),
          const Gap(16),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                AmenityDisplay.withLabel(
                  icon: SolarIconsOutline.home1,
                  label: "House",
                ),
                AmenityDisplay.withQty(icon: SolarIconsOutline.bed, qty: 4),

                AmenityDisplay.withQty(icon: SolarIconsOutline.bath, qty: 4),
                AmenityDisplay.withQty(icon: SolarIconsOutline.garage, qty: 2),
                AmenityDisplay.withLabel(
                  icon: SolarIconsOutline.rulerAngular,
                  label: "182m",
                ),
                AmenityDisplay.withLabel(
                  icon: SolarIconsOutline.cropMinimalistic,
                  label: "552m",
                ),
              ],
            ),
          ),
          const Gap(24),
          Row(
            children: [
              IconButtons.icon(icon: SolarIconsOutline.star),
              const Gap(16),
              IconButtons.icon(icon: SolarIconsOutline.share),
              const Gap(16),
              IconButtons.label(
                icon: SolarIconsOutline.documentAdd,
                label: "Report",
              ),
            ],
          ),
          const Gap(40),
          _detailTitle("On This Page"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: titles
                .map(
                  (title) => ActionChip(
                    padding: EdgeInsets.all(8),
                    backgroundColor: AppColors.gray50,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    label: Text(title),
                    onPressed: () {},
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  _detailTitle(String title) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 16),
      child: Text(title, style: context.headlineSmall),
    );
  }
}
