import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class ViewingView extends StatelessWidget {
  final String filePath;
  const ViewingView({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevTools.placeholder("Viewing view");
  }
}
