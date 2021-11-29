import 'package:flutter/material.dart';

class CreationAwareWidget extends StatefulWidget {
  final Function? onItemCreated;
  final Function? onItemDisposed;
  final Widget child;

  const CreationAwareWidget(
      {required this.child, this.onItemCreated, this.onItemDisposed, Key? key})
      : super(key: key);

  @override
  _CreationAwareWidgetState createState() => _CreationAwareWidgetState();
}

class _CreationAwareWidgetState extends State<CreationAwareWidget> {
  @override
  void initState() {
    if (widget.onItemCreated != null) {
      widget.onItemCreated!();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    if (widget.onItemDisposed != null) {
      widget.onItemDisposed!();
    }
    super.dispose();
  }
}
