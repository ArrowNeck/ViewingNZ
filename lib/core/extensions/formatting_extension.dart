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

extension CompactCurrencyFormatter on num {
  String toCompactCurrency({String symbol = '\$'}) {
    final formatter = NumberFormat.compactCurrency(
      symbol: symbol,
      decimalDigits: this < 100000 ? 0 : 1,
    );
    return formatter.format(this);
  }
}
