import '../../utils/illustration.dart';
import 'package:flutter/material.dart';

import '../../utils/tools.dart';

part 'widgets/technical_view.dart';

class ExceptionView extends StatelessWidget {
  final dynamic exception;
  final StackTrace? trace;
  final bool closable;

  static ExceptionView fromError(dynamic e) => ExceptionView(exception: e);
  static ExceptionView fromErrorClosable(dynamic e) => ExceptionView(
        exception: e,
        closable: true,
      );

  /// This is a widget for displaying a general error to the user
  ///
  /// A custom error object [exception] needs to be supplied. Additionally,
  /// a [trace] of what happend can be appended. When displaying the Widget as
  /// it's own page, you might want to enable the [closable] flag which allows
  /// 'pop'-ing the widget if the current context allows.
  const ExceptionView(
      {Key? key, required this.exception, this.trace, this.closable = false})
      : super(key: key);

  /// Route to the ExceptionView widget on a seperate page
  ///
  /// Note: When using this function, the [closable] flag is true by default,
  /// since the widget will be pushed to the navigation stack
  static void navigate(BuildContext context,
      {required dynamic exception, StackTrace? trace, bool closable = true}) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (ctx) => ExceptionView(
              exception: exception,
              trace: trace,
              closable: closable,
            )));
  }

  static ExceptionView builder(dynamic exception) {
    return ExceptionView(exception: exception);
  }

  @override
  Widget build(BuildContext context) {
    final bool showClose = closable && Navigator.of(context).canPop();
    return Scaffold(
        appBar: AppBar(
          //title: Text("😳"),
          automaticallyImplyLeading: false,
          leading: showClose
              ? IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded))
              : null,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 140, bottom: 60),
                      child: Center(
                          child: Illustration(
                        Illustrations.fixingBugs,
                        height: 150,
                      ))),
                  Text(l10n(context).lbl_errorTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    l10n(context).lbl_errorAbout,
                    textAlign: TextAlign.center,
                    //style: Theme.of(context).textTheme.headline3
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _TechnicalExceptionView(
                    exception: exception,
                    trace: trace,
                  ),
                ],
              ),
            )));
  }
}
