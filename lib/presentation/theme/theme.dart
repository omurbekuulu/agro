import 'package:agro/presentation/theme/color_extantion.dart';
import 'package:agro/presentation/theme/palette.dart';
import 'package:agro/presentation/theme/typography.dart';
import 'package:agro/presentation/theme/typography_extantion.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData _base(Brightness brightness) {
    final defaultTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Monserrat',
    );

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        bodyMedium: AppTypography.p1.regular.copyWith(color: Colors.black),
      ),
    );
  }

  static final _typography = AppTypographyExtension(
    h0: AppTypography.h0,
    h1: AppTypography.h1,
    h2: AppTypography.h2,
    h3: AppTypography.h3,
    p1: AppTypography.p1,
    p2: AppTypography.p2,
    p3: AppTypography.p3,
  );

  static final _appColors = AppColorExtantion(
    primary: AppPalette.forestGreen,
    secondary1: AppPalette.green,
    secondary2: AppPalette.semiTransparentGreen,
    secondary3: AppPalette.semiTransparentOrange,
    secondary4: AppPalette.semiTransparentRed,
    background: AppPalette.white,
    onBackground: AppPalette.lightGray,
  );

  ThemeData light() {
    final baseTheme = _base(Brightness.light);
    return baseTheme.copyWith(
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: _appColors.background,
        surface: _appColors.background,
      ),
      scaffoldBackgroundColor: _appColors.background,
      extensions: [
        _typography,
      ],
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        hintStyle: const TextStyle(
          color: Color(0xFF6F6D73),
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: _appColors.primary,
          textStyle: _typography.p1.bold.copyWith(color: _appColors.background),
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

extension AppThemeExtention on ThemeData {
  AppColorExtantion get appColors {
    return extension<AppColorExtantion>() ?? AppTheme._appColors;
  }

  AppTypographyExtension get appTypography {
    return extension<AppTypographyExtension>() ?? AppTheme._typography;
  }
}
