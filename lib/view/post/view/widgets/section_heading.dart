import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String heading;
  const SectionHeading(this.heading, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
