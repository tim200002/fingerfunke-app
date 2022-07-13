import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context)!;

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

  static loadingScaffold({bool? withAppBar}) {
    return Scaffold(
      appBar: withAppBar == true ? AppBar() : null,
      body: const Center(
        child: CircularProgressIndicator(),
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

  static Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file =
        File('${(await getTemporaryDirectory()).path}/mux_test_video.mp4');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  static void navigate(BuildContext context,
      {required Widget Function(bool isDialog) builder, String? routeName}) {
    MediaQuery.of(context).size.width > 700
        ? showDialog<void>(
            context: context,
            //useSafeArea: false,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              var mediaQuery = MediaQuery.of(context);
              return Material(
                  type: MaterialType.transparency,
                  child: AnimatedContainer(
                      padding: mediaQuery.viewInsets,
                      duration: const Duration(milliseconds: 300),
                      child: Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Theme.of(context).colorScheme.background,
                          constraints: const BoxConstraints(
                              maxWidth: 500, maxHeight: 600),
                          child: builder(true),
                        ),
                      ))));
            })
        : Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (_) =>
                    Container(color: Colors.black, child: builder(false)),
                settings: RouteSettings(name: routeName)));
  }
}
