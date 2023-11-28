import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonView extends StatelessWidget {
  static const Alignment topLeft = Alignment.topLeft;
  static const Color baseColor = Color(0xFFF5F5F5);

  static Widget shimmer(Widget child) {
    return Shimmer.fromColors(
        baseColor: const Color(0xFFEFEFEF),
        highlightColor: Colors.white,
        child: child);
  }

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Alignment alignment;
  final double? borderWidth;
  final double borderRadius;
  final Color color;
  final Widget? child;

  const SkeletonView(
      {Key? key,
      this.width,
      this.height,
      this.margin,
      this.alignment = topLeft,
      this.borderWidth,
      this.borderRadius = 7})
      : color = baseColor,
        child = null,
        super(key: key);

  const SkeletonView.background(
      {Key? key,
      this.width,
      this.height,
      this.margin,
      this.alignment = topLeft,
      this.borderWidth,
      this.borderRadius = 7,
      this.child})
      : color = Colors.white,
        super(key: key);

  const SkeletonView.text(
      {Key? key,
      this.width,
      this.alignment = topLeft,
      this.borderWidth,
      this.color = baseColor,
      this.margin = const EdgeInsets.only(bottom: 10)})
      : height = 20,
        borderRadius = 7,
        child = null,
        super(key: key);
  const SkeletonView.headline(
      {Key? key,
      this.width,
      this.alignment = topLeft,
      this.borderWidth,
      this.color = baseColor,
      this.margin = const EdgeInsets.only(bottom: 10)})
      : height = 25,
        borderRadius = 7,
        child = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        child: child,
        decoration: BoxDecoration(
            border: borderWidth != null
                ? Border.all(color: Colors.white, width: borderWidth!)
                : null,
            borderRadius: BorderRadius.circular(borderRadius),
            color: color),
      ),
    );
  }
}
