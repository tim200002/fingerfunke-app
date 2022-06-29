import 'package:flutter/material.dart';

class EditLoadingView extends StatelessWidget {
  final String message;
  const EditLoadingView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ));
  }
}

//TODO: Combine with loading view
class EditErrorView extends StatelessWidget {
  const EditErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.warning_rounded, color: Colors.red),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Error saving post",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ));
  }
}
