import 'package:flutter/material.dart';

typedef IllustrationKey = String;

class Illustrations {
  static const IllustrationKey login = "login";
  static const IllustrationKey party = "party";
  static const IllustrationKey fixingBugs = "fixing_bugs";
  static const IllustrationKey empty = "empty";
  static const IllustrationKey door = "door";
}

class Illustration extends Image {
  static const _undrawBase = "assets/img/illustrations/undraw/";

  static _getPath(IllustrationKey name) => _undrawBase + name + ".png";

  Illustration(final IllustrationKey name,
      {Key? key, double? height = 250, double? width})
      : super.asset(_getPath(name), key: key, height: height, width: width);
}
