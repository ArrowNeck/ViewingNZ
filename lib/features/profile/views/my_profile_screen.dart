import 'package:flutter/material.dart';
import 'package:viewing_nz/features/profile/widgets/email_verified.dart';
import 'package:viewing_nz/features/profile/widgets/profile_completion.dart';
import 'package:viewing_nz/features/profile/widgets/profile_header.dart';
import 'package:viewing_nz/features/profile/widgets/property_journey_stage.dart';
import 'package:viewing_nz/features/profile/widgets/property_stage_verified.dart';
import 'package:viewing_nz/features/profile/widgets/update_name.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final ValueNotifier<bool> showPropertyVerified = ValueNotifier(true);

  @override
  void dispose() {
    showPropertyVerified.dispose();
    super.dispose();
  }

  void onPropertyStageEditChange() {
    showPropertyVerified.value = !showPropertyVerified.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              ProfileHeader(),
              ProfileCompletion(),
              EmailVerified(),
              ValueListenableBuilder(
                valueListenable: showPropertyVerified,
                builder: (context, value, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: value
                        ? PropertyStageVerified(
                            onEditPressed: onPropertyStageEditChange,
                          )
                        : PropertyJourneyStage(
                            onUpdatePressed: onPropertyStageEditChange,
                          ),
                  );
                },
              ),

              UpdateName(),
            ],
          ),
        ),
      ),
    );
  }
}
