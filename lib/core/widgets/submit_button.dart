import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
  });

  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 50),
      ),
      child: Text(text),
    );
  }
}
