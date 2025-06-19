import 'package:flutter/material.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class AnimatedDropMenu extends StatefulWidget {
  const AnimatedDropMenu({
    super.key,
    required this.items,
    required this.selected,
    required this.onChanged,
  });

  final List<String> items;
  final ValueChanged<String> onChanged;
  final String selected;

  @override
  State<AnimatedDropMenu> createState() => _AnimatedDropMenuState();
}

class _AnimatedDropMenuState extends State<AnimatedDropMenu>
    with SingleTickerProviderStateMixin {
  ValueNotifier<bool> isDropdownOpen = ValueNotifier(false);

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;

    if (isDropdownOpen.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.gray50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.selected,
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray800,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isDropdownOpen,
                  builder: (context, value, child) {
                    return Icon(
                      value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.gray50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 0,
                maxHeight: context.screenHeight * .25,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: widget.items
                      .map(
                        (item) => GestureDetector(
                          onTap: () {
                            widget.onChanged(item);
                            _toggleDropdown();
                          },
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                item,
                                style: context.bodyMedium.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.gray800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
