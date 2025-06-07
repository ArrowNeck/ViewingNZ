import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';
import 'package:viewing_nz/core/widgets/property_tag.dart';
import 'package:viewing_nz/features/home/widgets/listed_and_ref_id.dart';
import 'package:viewing_nz/features/home/widgets/price_and_address.dart';
import 'package:viewing_nz/features/home/widgets/viewing_poster.dart';

class ViewingCard extends StatelessWidget {
  const ViewingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => context.push(Routes.viewingDetails),
        child: Column(
          children: [
            Stack(
              children: [
                ViewingPoster(
                  url:
                      "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: PropertyTag.light(name: "Rent"),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.pureBlack.withAlpha(50),
                    child: Icon(
                      SolarIconsOutline.starFallMinimalistic2,
                      color: AppColors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ListedAndRefId.withoutTag(
                      date: "12 Mar",
                      refId: 2345,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomAvatar(
                            radius: 24,
                            url: "https://picsum.photos/id/51/500/500",
                          ),
                          const Gap(8),
                          CustomAvatar(
                            radius: 24,
                            url: "https://picsum.photos/id/52/500/500",
                          ),
                          const Spacer(),
                          VerticalDivider(color: AppColors.gray300),
                          const Spacer(),
                          Image.asset("assets/images/vatero.png"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PriceAndAddress(
              price: "USD 4,595,000.00",
              address: "32B Dart Place, Fernhill, Queenstown",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  AmenityDisplay.withQty(icon: SolarIconsOutline.bed, qty: 4),
                  AmenityDisplay.withQty(icon: SolarIconsOutline.bath, qty: 4),
                  AmenityDisplay.withQty(
                    icon: SolarIconsOutline.garage,
                    qty: 2,
                  ),
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
          ],
        ),
      ),
    );
  }
}
