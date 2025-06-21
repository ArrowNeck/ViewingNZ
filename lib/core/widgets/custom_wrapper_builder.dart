import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class CustomWrapperBuilder extends StatelessWidget {
  const CustomWrapperBuilder({
    super.key,
    required this.notifier,
    required this.items,
  });

  final ValueNotifier<List<String?>> notifier;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, values, child) {
        return Wrap(
          spacing: 8,
          runSpacing: 0,
          children: List.generate(items.length, (index) {
            final item = items[index];
            return ActionChip(
              padding: EdgeInsets.all(6),
              backgroundColor: values.contains(item)
                  ? AppColors.gunmetal600
                  : Colors.transparent,
              side: BorderSide(color: AppColors.gunmetal600),
              shape: StadiumBorder(),
              label: Text(
                item,
                style: context.bodyMedium.copyWith(
                  color: values.contains(item)
                      ? AppColors.white
                      : AppColors.gunmetal600,
                ),
              ),
              onPressed: () {
                if (values.contains(item)) {
                  notifier.value = notifier.value
                      .where((t) => t != item)
                      .toList();
                } else {
                  notifier.value = [...notifier.value, item];
                }
              },
            );
          }),
        );
      },
    );
  }
}
