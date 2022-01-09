import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

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

  static Future<File> getImageFileFromAssets(String path) async{
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/mux_test_video.mp4');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
