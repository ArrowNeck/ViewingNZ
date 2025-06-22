import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/amenity_display.dart';
import 'package:viewing_nz/core/widgets/cached_image.dart';
import 'package:viewing_nz/core/widgets/custom_avatar.dart';
import 'package:viewing_nz/core/widgets/property_tag.dart';
import 'package:viewing_nz/core/widgets/listed_and_ref_id.dart';
import 'package:viewing_nz/core/widgets/price_and_address.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  final ValueNotifier<bool> _isFav = ValueNotifier(false);

  @override
  void dispose() {
    _isFav.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => context.push(Routes.viewingDetails),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 8 / 7,
                    child: CachedImage(
                      url:
                          "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: PropertyTag.light(name: "Rent"),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () => _isFav.value = !_isFav.value,
                    child: ValueListenableBuilder(
                      valueListenable: _isFav,
                      builder: (context, fav, child) {
                        return CircleAvatar(
                          radius: 20,
                          backgroundColor: fav
                              ? AppColors.primary
                              : AppColors.pureBlack.withAlpha(50),
                          child: SvgIcon(
                            SolarIcons.star,
                            color: AppColors.white,
                          ),
                        );
                      },
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
                    flex: 3,
                    child: ListedAndRefId.withoutTag(
                      date: "12 Mar",
                      refId: 2345,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
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
                          VerticalDivider(color: AppColors.gray300, width: 24),
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
              child: SizedBox(
                width: double.maxFinite,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AmenityDisplay(icon: SolarIcons.bed, qty: 4),
                      const Gap(12),
                      AmenityDisplay(icon: SolarIcons.bath, qty: 4),
                      const Gap(12),
                      AmenityDisplay(icon: SolarIcons.car, qty: 2),
                      const Gap(12),
                      AmenityDisplay(
                        icon: SolarIcons.rulerAngular,
                        label: "182m",
                      ),
                      const Gap(12),
                      AmenityDisplay(
                        icon: SolarIcons.cropMinimalistic,
                        label: "552m",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
