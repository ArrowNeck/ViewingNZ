import 'package:flutter/material.dart';
import 'package:viewing_nz/features/home/widgets/viewing_card.dart';

class SavedProperties extends StatefulWidget {
  const SavedProperties({super.key});

  @override
  State<SavedProperties> createState() => _SavedPropertiesState();
}

class _SavedPropertiesState extends State<SavedProperties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (_, index) => ViewingCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
