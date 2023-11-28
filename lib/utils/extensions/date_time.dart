import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FDateTime on DateTime {
  static DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  static DateFormat timeFormat = DateFormat("HH:mm");

  DateTime withTime(TimeOfDay time) =>
      DateTime(year, month, day, time.hour, time.minute, 0, 0, 0);

  DateTime withDate(DateTime date) =>
      DateTime(date.year, date.month, date.day, hour, minute, 0, 0, 0);

  String get dateString => dateFormat.format(this);
  String get timeString => timeFormat.format(this);

  TimeOfDay get timeOfDay => TimeOfDay.fromDateTime(this);

  String get monthAsAbbreviatedString {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "April";
      case 5:
        return "Mai";
      case 6:
        return "Juni";
      case 7:
        return "Juli";
      case 8:
        return "Aug";
      case 9:
        return "Sept";
      case 10:
        return "Okt";
      case 11:
        return "Nov";
      case 12:
        return "Dez";
    }

    throw Exception("This cannot happen motnh is always between 1 and 12");
  }
}
