import 'dart:io';

import 'package:intl/intl.dart';

extension DateTimeExtension on String {
  String toLocalFormat() {
    final locale = Platform.localeName.substring(0, 2);
    final dateTime = DateTime.parse(this);
    return DateFormat.yMMMMEEEEd(locale).format(dateTime);
  }
}
