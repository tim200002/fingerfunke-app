import 'package:flutter/material.dart';

/// Widget to consume the `Loading` state of the `VideoRecorderCubit`.
/// Might need additional styling to allow for more natural transitions
class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
