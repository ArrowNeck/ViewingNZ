import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class HomePropertyFilterLabel extends StatefulWidget {
  const HomePropertyFilterLabel({super.key});

  @override
  State<HomePropertyFilterLabel> createState() =>
      _HomePropertyFilterLabelState();
}

class _HomePropertyFilterLabelState extends State<HomePropertyFilterLabel> {
  late ValueNotifier<String> selected;
  final List<String> items = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
    'Newest',
    'Popular',
  ];

  @override
  void initState() {
    selected = ValueNotifier(items.first);
    super.initState();
  }

  @override
  void dispose() {
    selected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "Over ",
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: "1,000+",
                  style: context.titleLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: " Places in Auckland city, Auckland",
                  style: context.titleLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap(4),
          Row(
            children: [
              Text("Sort by:", style: context.bodyMedium),
              const Gap(8),
              Theme(
                data: ThemeData(highlightColor: Colors.transparent),
                child: ValueListenableBuilder(
                  valueListenable: selected,
                  builder: (context, value, child) {
                    return PopupMenuButton<String>(
                      initialValue: value,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      color: Colors.black.withAlpha(200),
                      surfaceTintColor: Colors.transparent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            value,
                            style: context.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(4),
                          const SvgIcon(SolarIcons.altArrowDown, size: 20),
                        ],
                      ),
                      itemBuilder: (BuildContext context) {
                        return items.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: context.bodyMedium.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      onSelected: (String newValue) {
                        selected.value = newValue;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
