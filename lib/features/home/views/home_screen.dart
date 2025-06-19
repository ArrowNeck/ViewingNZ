import 'package:flutter/material.dart';
import 'package:viewing_nz/core/widgets/property_card.dart';
import 'package:viewing_nz/features/home/widgets/home_basic_filter.dart';
import 'package:viewing_nz/features/home/widgets/home_property_filter_label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              HomeBasicFilter(),
              HomePropertyFilterLabel(),
              ...List<Widget>.generate(4, (int index) => PropertyCard()),
            ],
          ),
        ),
      ),
    );
  }
}
