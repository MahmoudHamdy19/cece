 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/app_export.dart';

extension DateTimeExtension on DateTime {
  String formattedTime(BuildContext context) {
    return DateFormat.jm(Get.locale!.languageCode).format(this);
  }

  String formattedDate(BuildContext context) {
    if (dateEquals(DateTime.now())) return 'today';

    if (dateEquals(DateTime.now().subtract(const Duration(days: 1)))) {
      return 'yesterday';
    }

    return DateFormat.yMMMMd(Get.locale!.languageCode).format(this);
  }

  DateTime get dateOnly => DateTime(year, month, day);

  bool dateEquals(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
