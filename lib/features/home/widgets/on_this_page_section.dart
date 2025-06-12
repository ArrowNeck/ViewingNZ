import 'package:flutter/material.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/features/home/widgets/section_label.dart';

class OnThisPageSection extends StatelessWidget {
  final List<String> titles;
  final List<GlobalKey> sectionKeys;

  const OnThisPageSection({
    super.key,
    required this.titles,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "On This Page"),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(titles.length, (index) {
            return ActionChip(
              padding: EdgeInsets.all(8),
              backgroundColor: AppColors.gray50,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              label: Text(titles[index]),
              onPressed: () {
                final keyContext = sectionKeys[index].currentContext;
                if (keyContext != null) {
                  Scrollable.ensureVisible(
                    keyContext,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  );
                } else {
                  debugPrint('Key not found or widget not built yet');
                }
              },
            );
          }),
        ),
      ],
    );
  }
}
