import 'package:flutter/material.dart';

class PropertyChartModel {
  PropertyChartModel({
    required this.propertyName,
    required this.comparisorName,
    required this.propertyColor,
    required this.comparisorColor,
    required this.data,
  });

  final String propertyName;
  final String comparisorName;
  final Color propertyColor;
  final Color comparisorColor;
  final List<ChartData> data;
}

class ChartData {
  ChartData({
    required this.propertyValue,
    required this.comparisorValue,
    required this.month,
  });

  final String month;
  final double propertyValue;
  final double comparisorValue;
}
