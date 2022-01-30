import 'package:flutter/material.dart';

class VisibilityController extends StatefulWidget {
  final Widget child;

  const VisibilityController({Key? key, required this.child}) : super(key: key);

  @override
  _VisibilityControllerState createState() {
    return _VisibilityControllerState();
  }
}

class _VisibilityControllerState extends State<VisibilityController> {
  ScrollPosition? scrollPosition;
  bool isVisible = false;

  @override
  void dispose() {
    removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    removeListener();
    addListener();
  }

  void addListener() {
    scrollPosition = Scrollable.of(context)?.position;
    scrollPosition?.addListener(positionListener);
    //  positionListener();
  }

  void removeListener() {
    scrollPosition?.removeListener(positionListener);
  }

  void positionListener() {
    final FlexibleSpaceBarSettings? settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();

    bool visible = false;

    if (settings != null) visible = settings.minExtent == settings.currentExtent;

    if (isVisible != visible) setState(() => isVisible = visible);
  }

  @override
  Widget build(BuildContext context) => Visibility(visible: isVisible, child: widget.child);
}