import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:path_provider/path_provider.dart';

class AppTools {
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

  static Widget loadingBuilder() {
    return const Center(child: CircularProgressIndicator.adaptive());
  }

  static void pushPage(
      BuildContext context, Widget Function(BuildContext c) builder) {
    Navigator.of(context).push(MaterialPageRoute(builder: builder));
  }

  static Widget providingCubitBuilder<C extends Cubit<S>, S>(
      {required C Function(BuildContext c) create,
      required Widget Function(BuildContext context, S state) builder}) {
    return BlocProvider<C>(
      create: create,
      child: BlocBuilder<C, S>(builder: builder),
    );
  }

  static List<BoxShadow> shadow([double elevation = 1]) {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        spreadRadius: -7 * elevation,
        blurRadius: 10 * elevation,
        offset: const Offset(0, 3),
      ),
    ];
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
