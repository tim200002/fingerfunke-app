import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class InfoView extends StatelessWidget {
  final String text;
  final IconData icon;
  final EdgeInsets padding;
  final bool showBackButton;
  const InfoView(
      {super.key,
      required this.text,
      this.icon = FeatherIcons.info,
      this.padding = const EdgeInsets.all(20),
      this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: showBackButton ? AppBar(foregroundColor: Colors.black) : null,
        body: Padding(
          padding: padding,
          child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 25),
                Center(
                  child: Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                      )),
                ),
              ]),
        ));
  }
}
