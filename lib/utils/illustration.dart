import 'package:flutter/material.dart';

enum Illustrations {
  login("login"),
  party("party"),
  fixingBugs("fixing_bugs"),
  empty("empty"),
  door("door"),
  dreamer("dreamer"),
  location("location"),
  parashute("parashute"),
  build("build"),
  contract("contract"),
  science("science");

  const Illustrations(this.name);

  final String name;
}

class Illustration extends Image {
  static const _undrawBase = "assets/img/illustrations/undraw/";

  static _getPath(Illustrations i) => _undrawBase + i.name + ".png";

  Illustration(final Illustrations i,
      {Key? key, double? height = 250, double? width})
      : super.asset(_getPath(i), key: key, height: height, width: width);
}
