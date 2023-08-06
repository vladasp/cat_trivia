import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/services/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ThemeService {
  factory ThemeService.light() {
    return ThemeService._privateConstructor(
      primaryColor: const Color(0xff416CAA),
      secondaryColor: const Color(0xff21252A),
      tertiaryColor: const Color.fromARGB(255, 114, 128, 144),
      accentColor: const Color.fromARGB(255, 223, 233, 243),
      backgroundColor: const Color(0xffF1F4F7),
    );
  }

  ThemeService._privateConstructor({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.accentColor,
    required this.backgroundColor,
  });
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color accentColor;
  final Color backgroundColor;

  ThemeData get theme {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        AppColorScheme(
          accentColor: accentColor,
          primaryColor: primaryColor,
          tertiaryColor: tertiaryColor,
          secondaryColor: secondaryColor,
          backgroundColor: backgroundColor,
        ),
        AppTextStyle(
          primaryDarkTextColor: secondaryColor,
          secondaryDarkTextColor: tertiaryColor,
          primaryLightTextColor: accentColor,
        ),
      ],
      brightness: Brightness.light,
      primaryColor: primaryColor,
      canvasColor: Colors.transparent,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
