import 'package:flutter/material.dart';

/// Store global variables here
/// This should be a singleton class and thus registered using GetIt
class GlobalsService{
  // This key referenced to the base scaffold of our material App
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}