import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_icons/solar_icons.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputType,
    this.width,
    this.inputFormatters,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.onChanged,
    this.labelText,
    this.fillColor,
    this.textInputAction,
    this.prefixIcon,
    this.maxLines,
  });

  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool obscureText;
  final double? width;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final int? maxLines;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  ValueNotifier<bool> showHide = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText ? showHide.value : widget.obscureText,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        textAlignVertical: TextAlignVertical.center,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          filled: true,
          fillColor: widget.fillColor,
          alignLabelWithHint: true,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon)
              : null,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: ValueListenableBuilder(
                    valueListenable: showHide,
                    builder: (context, isHide, child) {
                      return Icon(
                        isHide
                            ? SolarIconsOutline.eyeClosed
                            : SolarIconsOutline.eye,
                      );
                    },
                  ),
                  onPressed: () => showHide.value = !showHide.value,
                )
              : null,
        ),
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
      ),
    );
  }
}
