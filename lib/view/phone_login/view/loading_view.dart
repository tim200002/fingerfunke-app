import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final String title;
  const LoadingView(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
