import 'package:flutter/material.dart';

@immutable
abstract class PaginatedListStateInterface<T>{

  const PaginatedListStateInterface();
  List<T> get items;
  bool get isLoading;
  bool get reachedEnd;

  int get itemCount;
}