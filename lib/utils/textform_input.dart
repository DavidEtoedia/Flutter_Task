import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput(
      {Key? key,
      required this.controller,
      this.autovalidateMode,
      required this.validator,
      this.labelText,
      this.obscureText = false,
      this.onChanged,
      this.onTap,
      this.inputFormatters,
      this.enabled,
      this.textLength,
      this.isBorderRadius = false,
      this.isColor = Colors.black,
      this.readOnly = false,
      this.onFieldSubmitted,
      this.capitalization = TextCapitalization.words,
      this.minLine = 1,
      this.maxLine = 1,
      this.borderRadius = 7.0,
      this.keyboardType})
      : super(key: key);

  final String? labelText;
  final bool obscureText;
  final bool? enabled;
  final bool readOnly;
  final bool isBorderRadius;
  final Color isColor;
  final int minLine;
  final int maxLine;
  final double borderRadius;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?) validator;
  final TextCapitalization capitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? textLength;
  final void Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      cursorColor: isColor,
      readOnly: readOnly,
      minLines: minLine,
      maxLines: maxLine,
      autovalidateMode: autovalidateMode,
      textCapitalization: capitalization,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Colors.black,
          fontSize: 14.5,
          letterSpacing: 0.5,
          fontWeight: AppFontWeight.regular),
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        fillColor: AppColors.inputbox,
        filled: true,
        errorStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: Colors.red, letterSpacing: 0.5, fontSize: 15),
        iconColor: Colors.grey,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(width: 0.5, color: Colors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: AppColors.inputStroke,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: labelText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.hintColor,
              fontSize: 13,
            ),
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
    );
  }
}
