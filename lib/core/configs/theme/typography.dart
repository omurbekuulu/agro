import 'package:flutter/material.dart';

abstract class AppTypography {
  static final h0 = AppFontStyle._withSize(fontSize: 32);
  static final h1 = AppFontStyle._withSize(fontSize: 24);
  static final h2 = AppFontStyle._withSize(fontSize: 20);
  static final h3 = AppFontStyle._withSize(fontSize: 18);

  static final p1 = AppFontStyle._withSize(fontSize: 16);
  static final p2 = AppFontStyle._withSize(fontSize: 14);
  static final p3 = AppFontStyle._withSize(fontSize: 12);
}

class AppFontStyle {
  AppFontStyle({
    required this.bold,
    required this.semiBold,
    required this.medium,
    required this.regular,
    required this.light,
  });

  AppFontStyle._withSize({required double fontSize})
      : bold = TextStyle(
          fontFamily: 'Monserrat',
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        semiBold = TextStyle(
          fontFamily: 'Monserrat',
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        medium = TextStyle(
          fontFamily: 'Monserrat',
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
        regular = TextStyle(
          fontFamily: 'Monserrat',
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
        light = TextStyle(
          fontFamily: 'Monserrat',
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
        );

  final TextStyle bold;
  final TextStyle semiBold;
  final TextStyle medium;
  final TextStyle regular;
  final TextStyle light;

  static AppFontStyle lerp(AppFontStyle? a, AppFontStyle? b, double t) {
    return AppFontStyle(
      bold: TextStyle.lerp(a?.bold, b?.bold, t)!,
      semiBold: TextStyle.lerp(a?.semiBold, b?.semiBold, t)!,
      medium: TextStyle.lerp(a?.medium, b?.medium, t)!,
      regular: TextStyle.lerp(a?.regular, b?.regular, t)!,
      light: TextStyle.lerp(a?.light, b?.light, t)!,
    );
  }
}
