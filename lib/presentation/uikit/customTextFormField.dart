import 'package:flutter/material.dart';

import 'package:agro/presentation/theme/theme.dart';

Widget customTextFormField(
  BuildContext context, {
  required TextInputType inputType,
  required String hintText,
  bool hasValue = false,
  bool hasUnderLine = false,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return TextFormField(
    initialValue: hasValue ? hintText : '',
    autovalidateMode: AutovalidateMode.onUnfocus,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Поля не должна быть пустым';
      }
      return null;
    },
    cursorColor: Colors.black,
    keyboardType: inputType,
    decoration: InputDecoration(
      filled: true,
      fillColor: colors.onBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintText: hintText,
      hintStyle: typography.p1.medium.copyWith(color: colors.onBackground2,),
    ),
  );
}
