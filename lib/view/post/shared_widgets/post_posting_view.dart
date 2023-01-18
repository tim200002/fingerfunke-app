import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../utils/tools.dart';

class PostPostingView extends StatelessWidget {
  const PostPostingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _SendAnimation(height: 200, width: 200),
                const SizedBox(height: 20),
                Text(
                  l10n(context).lbl_submitting,
                  textAlign: TextAlign.center,
                )
              ]),
        ),
      )),
    );
  }
}

class _SendAnimation extends StatefulWidget {
  final double height;
  final double width;

  const _SendAnimation({required this.height, required this.width});

  @override
  State<_SendAnimation> createState() => __SendAnimationState();
}

class __SendAnimationState extends State<_SendAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 7), vsync: this)
        ..repeat();

  @override
  Widget build(BuildContext context) {
    Size size = Size(widget.width, widget.height);
    double iconDimension = 35;
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(children: <Widget>[
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                  Rect.fromLTWH(0, size.height - iconDimension, iconDimension,
                      iconDimension),
                  size),
              end: RelativeRect.fromSize(
                  Rect.fromLTWH(size.width - iconDimension, 0, iconDimension,
                      iconDimension),
                  size),
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut,
            )),
            child: Center(
              child: Icon(
                FeatherIcons.send,
                color: Theme.of(context).colorScheme.primary,
                size: iconDimension,
              ),
            ),
          )
        ]));
  }
}
