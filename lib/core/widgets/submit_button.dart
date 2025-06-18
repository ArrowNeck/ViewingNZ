import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
  });

  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 40),
      ),
      child: Text(text),
    );
  }
}
