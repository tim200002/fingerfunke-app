import 'package:flutter/material.dart';

Widget postAppBarButton({required BuildContext context, required IconData icon, required Function() onPressed}) {
  return AspectRatio(
    aspectRatio: 1,
    child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            onPressed: onPressed,
            icon: Icon(icon))),
  );
}
