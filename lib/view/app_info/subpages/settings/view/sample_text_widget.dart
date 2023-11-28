import 'package:flutter/material.dart';

class SampleTextWidget extends StatelessWidget {
  const SampleTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Beispiel Text",
                style: Theme.of(context).textTheme.headline4,
              ),
              const Divider(),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quam erat, elementum nec facilisis vitae, pharetra eget ante. Sed est felis, sagittis a tristique sed, condimentum nec dolor.")
            ],
          ),
        ),
      ),
    );
  }
}
