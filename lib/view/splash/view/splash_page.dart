import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: Center(
        child: Shimmer.fromColors(
            child: Image.asset("assets/img/brand/icon_trans.png", height: 100),
            baseColor: color,
            highlightColor: color.withOpacity(0.3)),
      ),
    );
  }
}
