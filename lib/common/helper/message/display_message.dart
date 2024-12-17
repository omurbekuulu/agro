import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter/material.dart';

class DisplayMessage {
  static void errorMessage(String message, BuildContext context) {
    final colors = Theme.of(context).appColors;
    var snackbar = SnackBar(
      content: Text(
        message == 'username already exists'
            ? 'Колдонуучунун аты мурунтан катталган'
            : 'username already exists',
        style: TextStyle(
          color: colors.onBackground3,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: colors.background,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
