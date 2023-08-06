import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  AppTextStyle({
    required this.primaryDarkTextColor,
    required this.secondaryDarkTextColor,
    required this.primaryLightTextColor,
  }) {
    headline = GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: primaryLightTextColor,
    );

    buttonRegular = GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: primaryLightTextColor,
    );

    bodyRegular = GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: primaryDarkTextColor,
    );

    bodySmall = GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: secondaryDarkTextColor,
    );

    labelRegular = GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: primaryDarkTextColor,
    );

    labelSmall = GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: secondaryDarkTextColor,
    );
  }

  final Color? primaryDarkTextColor;
  final Color? secondaryDarkTextColor;
  final Color? primaryLightTextColor;

  late TextStyle headline;
  late TextStyle buttonRegular;

  late TextStyle bodyRegular;
  late TextStyle bodySmall;

  late TextStyle labelRegular;
  late TextStyle labelSmall;

  @override
  ThemeExtension<AppTextStyle> copyWith({
    Color? primaryDarkTextColor,
    Color? secondaryDarkTextColor,
    Color? primaryLightTextColor,
  }) {
    return AppTextStyle(
      primaryDarkTextColor: primaryDarkTextColor ?? this.primaryDarkTextColor,
      secondaryDarkTextColor:
          secondaryDarkTextColor ?? this.secondaryDarkTextColor,
      primaryLightTextColor:
          primaryLightTextColor ?? this.primaryLightTextColor,
    );
  }

  @override
  ThemeExtension<AppTextStyle> lerp(
    ThemeExtension<AppTextStyle>? other,
    double t,
  ) {
    if (other is! AppTextStyle) {
      return this;
    }
    return AppTextStyle(
      primaryDarkTextColor:
          Color.lerp(primaryDarkTextColor, other.primaryDarkTextColor, t),
      secondaryDarkTextColor:
          Color.lerp(secondaryDarkTextColor, other.secondaryDarkTextColor, t),
      primaryLightTextColor:
          Color.lerp(primaryLightTextColor, other.primaryLightTextColor, t),
    );
  }
}
