import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeFormattingExtension on double {
  String toFormattedTime() {
    final time = TimeOfDay(hour: toInt(), minute: ((this % 1) * 60).round());

    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    return DateFormat.jm().format(dateTime);
  }
}

extension TimeOfDayFormatter on TimeOfDay {
  String formatAmPm({bool lowercase = true}) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);

    String formatted = DateFormat('hh:mm a').format(dateTime);
    return lowercase ? formatted.toLowerCase() : formatted;
  }
}

extension TimeOfDayParsing on String {
  TimeOfDay toTimeOfDay({String pattern = 'hh:mm a'}) {
    final dateTime = DateFormat(pattern).parse(toUpperCase());
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }
}

extension CompactCurrencyFormatter on num {
  String toCompactCurrency({String symbol = '\$'}) {
    final formatter = NumberFormat.compactCurrency(
      symbol: symbol,
      decimalDigits: this < 100000 ? 0 : 1,
    );
    return formatter.format(this);
  }
}
