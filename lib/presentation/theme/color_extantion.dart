// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColorExtantion extends ThemeExtension<AppColorExtantion> {
  AppColorExtantion({
    required this.primary,
    required this.secondary1,
    required this.secondary2,
    required this.secondary3,
    required this.secondary4,
    required this.background,
    required this.onBackground,
    required this.onBackground2,
  });

  final Color primary;
  final Color secondary1;
  final Color secondary2;
  final Color secondary3;
  final Color secondary4;

  final Color background;
  final Color onBackground;
  final Color onBackground2;

  AppColorExtantion copyWith({
    Color? primary,
    Color? secondary1,
    Color? secondary2,
    Color? secondary3,
    Color? secondary4,
    Color? background,
    Color? onBackground,
    Color? onBackground2,
  }) {
    return AppColorExtantion(
      primary: primary ?? this.primary,
      secondary1: secondary1 ?? this.secondary1,
      secondary2: secondary2 ?? this.secondary2,
      secondary3: secondary3 ?? this.secondary3,
      secondary4: secondary4 ?? this.secondary4,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      onBackground2: onBackground2 ?? this.onBackground2,
    );
  }

  @override
  ThemeExtension<AppColorExtantion> lerp(
      covariant ThemeExtension<AppColorExtantion>? other, double t) {
    if (other is! AppColorExtantion) {
      return this;
    }
    return AppColorExtantion(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary1: Color.lerp(secondary1, other.secondary1, t)!,
      secondary2: Color.lerp(secondary2, other.secondary2, t)!,
      secondary3: Color.lerp(secondary3, other.secondary3, t)!,
      secondary4: Color.lerp(secondary4, other.secondary4, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackground2: Color.lerp(onBackground2, other.onBackground2, t)!,
    );
  }
}
