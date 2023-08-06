import 'dart:io';

import 'package:cat_trivia/l10n/l10n.dart';
import 'package:cat_trivia/router/router.dart';
import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/services/theme/app_text_style.dart';
import 'package:cat_trivia/widgets/popups/android_alert.dart';
import 'package:cat_trivia/widgets/popups/ios_alert.dart';
import 'package:flutter/material.dart';

class Popup {
  static BuildContext get context => navigatorKey.currentContext!;
  static AppLocalizations get l10n => context.l10n;

  static AppTextStyle get styles =>
      Theme.of(context).extension<AppTextStyle>()!;
  static AppColorScheme get colors =>
      Theme.of(context).extension<AppColorScheme>()!;

  static Future<bool> showAlert({
    required String title,
    required String message,
  }) async {
    final result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => Platform.isAndroid
          ? AndroidAlert(title: title, message: message)
          : IOSAlert(title: title, message: message),
    );
    return result ?? false;
  }
}
