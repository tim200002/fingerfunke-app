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
      backgroundColor: color,
      body: Center(
        child: Shimmer.fromColors(
            child: Image.asset("assets/img/brand/icon_trans.png", height: 140),
            baseColor: Colors.white,
            highlightColor: Colors.white.withOpacity(0.4)),
      ),
    );
  }
}
