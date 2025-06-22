import 'package:flutter/material.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/utils/core_utils.dart';
import 'package:viewing_nz/core/widgets/request_filter.dart';

class SavedSearchHeader extends StatelessWidget {
  const SavedSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Saved Search",
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () =>
                  CoreUtils.heroDialog(RequestFilter(onFindResults: () {})),
              child: SvgIcon(SolarIcons.filter, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
