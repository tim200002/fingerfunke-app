import 'package:fingerfunke_app/app.dart';
import 'package:fingerfunke_app/view/error/technical_view.dart';
import 'package:flutter/material.dart';

class ExceptionView extends StatelessWidget {
  final Exception exception;
  const ExceptionView({Key? key, required this.exception}) : super(key: key);

  static void navigate(BuildContext context,
      {required Exception exception, bool closable = true}) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (ctx) => Scaffold(
            appBar: closable && Navigator.of(context).canPop()
                ? AppBar(
                    leading: IconButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        icon: const Icon(Icons.close_rounded)),
                  )
                : null,
            body: ExceptionView(
              exception: exception,
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: Image.asset(
                    "assets/img/illustrations/undraw/undraw_fixing_bugs.png",
                    height: 150),
              )),
          Text("Oh no :/",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 10,
          ),
          Text(
            "Ein unerwarteter Fehler ist aufgetreten.\n Wir haben den Fehler erfasst und machen uns gleich an die Arbeit",
            textAlign: TextAlign.center,
            //style: Theme.of(context).textTheme.headline3
          ),
          SizedBox(
            height: 20,
          ),
          TechnicalExceptionView(exception: exception)
        ],
      ),
    );
  }
}
