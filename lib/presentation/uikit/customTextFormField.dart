import 'package:flutter/material.dart';

import 'package:agro/presentation/theme/theme.dart';

Widget customTextFormField(BuildContext context, {required String hintText}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return TextFormField(
    autovalidateMode: AutovalidateMode.onUnfocus,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Поля не должна быть пустым';
      }
      return null;
    },
    cursorColor: Colors.black,
    keyboardType: TextInputType.number,
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
      hintStyle: typography.p1.medium.copyWith(color: colors.onBackground2),
    ),
  );
}