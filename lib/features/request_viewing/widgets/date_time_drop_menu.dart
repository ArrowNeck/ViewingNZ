import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

class DateTimeDropMenu extends StatefulWidget {
  const DateTimeDropMenu({super.key, required this.onChange});

  final ValueChanged<bool> onChange;

  @override
  State<DateTimeDropMenu> createState() => _DateTimeDropMenuState();
}

class _DateTimeDropMenuState extends State<DateTimeDropMenu> {
  bool isDropdownOpen = false;
  String? selectedDate = "22 Mar 25";
  String? selectedTime = "07:30 am - 08:00am";
  GlobalKey dropdownKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  bool isCustomInputSelect = false;

  final String preferredDateTimeText = "Preferred Date & Time";

  final List<Map<String, String>> dateTimeOptions = [
    {'date': '22 Mar 25', 'time': '07:30 am - 08:00am'},
    {'date': '23 Mar 25', 'time': '07:30 am - 08:00am'},
    {'date': '24 Mar 25', 'time': '07:30 am - 08:00am'},
  ];

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showDropdown() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox =
        dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: position.dy + size.height + 8,
        left: position.dx,
        width: size.width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.gray50,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...dateTimeOptions.asMap().entries.map((entry) {
                  Map<String, String> option = entry.value;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = option['date']!;
                        selectedTime = option['time']!;
                        isCustomInputSelect = false;
                        isDropdownOpen = false;
                      });
                      _removeOverlay();
                      widget.onChange(false);
                    },
                    child: DropItem.dateTime(
                      date: option['date'],
                      time: option['time'],
                    ),
                  );
                }),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = null;
                      selectedTime = null;
                      isCustomInputSelect = true;
                      isDropdownOpen = false;
                    });
                    _removeOverlay();
                    widget.onChange(true);
                  },
                  child: DropItem.preferred(
                    preferredText: preferredDateTimeText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _toggleDropdown() {
    if (isDropdownOpen) {
      _removeOverlay();
    } else {
      _showDropdown();
    }
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: dropdownKey,
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
            Expanded(
              child: isCustomInputSelect
                  ? Text(
                      preferredDateTimeText,
                      style: context.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray800,
                      ),
                    )
                  : CustomRichText(
                      date: selectedDate!,
                      time: selectedTime!,
                      color: AppColors.gray800,
                    ),
            ),
            const Gap(8),
            Icon(
              isDropdownOpen
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class DropItem extends StatelessWidget {
  const DropItem.dateTime({super.key, required this.date, required this.time})
    : last = false,
      preferredText = null;
  const DropItem.preferred({super.key, required this.preferredText})
    : last = true,
      date = null,
      time = null;

  final String? preferredText;
  final String? date;
  final String? time;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: !last
                  ? CustomRichText(date: date!, time: time!)
                  : Text(
                      preferredText!,
                      style: context.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
          if (!last) Divider(color: AppColors.gray300, thickness: 1, height: 0),
        ],
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.date,
    required this.time,
    this.color,
  });
  final String date;
  final String time;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        text: "Date: ",
        style: context.bodyMedium.copyWith(color: color),
        children: [
          TextSpan(
            text: date,
            style: context.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: "  |  ",
            style: context.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "Time: ",
            style: context.bodyMedium.copyWith(color: color),
          ),
          TextSpan(
            text: time,
            spellOut: true,
            style: context.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
