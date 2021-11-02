import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Tools {
  static showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }

  static String dateFromEpoch(int epoch) {
    return DateFormat('dd.MM.yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(epoch));
  }

  static String readableDateFromDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  static String timeFromEpoch(int epoch) {
    return DateFormat('hh:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(epoch));
  }

  static String readableTimeFromTimeOfDay(TimeOfDay timeOfDay) {
    return timeOfDay.toString().substring(10, 15);
  }
}
