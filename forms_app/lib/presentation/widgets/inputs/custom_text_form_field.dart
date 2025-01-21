// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscure;

  final Function(String)? onChange;

  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChange,
      this.validator,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    );

    final borderSide = BorderSide(width: 2);

    final focusedBorder = border.copyWith(borderSide: borderSide);

    final errorBorder = focusedBorder.copyWith(
        borderSide: borderSide.copyWith(color: Colors.red.shade800));

    return TextFormField(
      onChanged: onChange,
      validator: validator,
      obscureText: obscure,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border.copyWith(
              borderSide: borderSide.copyWith(color: colors.primary)),
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hint,
          focusColor: colors.primary,
          errorText: errorMessage),
    );
  }
}
