import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';

class RequestingButton extends StatelessWidget {
  const RequestingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SubmitButton(
          width: context.screenWidth * 0.55,
          height: 60,
          text: "Requesting a Viewing",
          onPressed: () => context.push(Routes.requestViewing),
        ),
      ),
    );
  }
}
