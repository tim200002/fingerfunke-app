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

  static T stringToEnum<T>(String s, List<T> values) {
    for (T value in values) {
      if (value.toString().toLowerCase().split(".").last == s.toLowerCase()) {
        return value;
      }
    }
    throw Exception(
        "error during serialization: enum entry '" + s + "' not found");
  }

  static String enumToString(dynamic value) {
    return value.toString().toLowerCase().split(".").last;
  }

  static List<T>? jsonListToList<T>(List<dynamic>? list,
      {T Function(dynamic element)? transformElement}) {
    if (list == null) {
      return null;
    }

    return list.map((element) {
      if (transformElement == null) {
        return element as T;
      } else {
        return transformElement(element);
      }
    }).toList();
  }
}
