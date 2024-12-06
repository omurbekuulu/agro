import 'package:agro/core/configs/theme/typography.dart';
import 'package:flutter/material.dart';

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  const AppTypographyExtension({
    required this.h0,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.p1,
    required this.p2,
    required this.p3,
  });

  final AppFontStyle h0;
  final AppFontStyle h1;
  final AppFontStyle h2;
  final AppFontStyle h3;
  final AppFontStyle p1;
  final AppFontStyle p2;
  final AppFontStyle p3;

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    AppFontStyle? h0,
    AppFontStyle? h1,
    AppFontStyle? h2,
    AppFontStyle? h3,
    AppFontStyle? p1,
    AppFontStyle? p2,
    AppFontStyle? p3,
  }) {
    return AppTypographyExtension(
      h0: h0 ?? this.h0,
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      p1: p1 ?? this.p1,
      p2: p2 ?? this.p2,
      p3: p3 ?? this.p3,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
      covariant ThemeExtension<AppTypographyExtension>? other, double t) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return AppTypographyExtension(
      h0: AppFontStyle.lerp(h0, other.h0, t),
      h1: AppFontStyle.lerp(h1, other.h1, t),
      h2: AppFontStyle.lerp(h2, other.h2, t),
      h3: AppFontStyle.lerp(h3, other.h3, t),
      p1: AppFontStyle.lerp(p1, other.p1, t),
      p2: AppFontStyle.lerp(p2, other.p2, t),
      p3: AppFontStyle.lerp(p3, other.p3, t),
    );
  }
}
