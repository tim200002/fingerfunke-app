import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';

abstract class MediaCache {
  Future<File> getSingleFile(String url);

  Future<ImageProvider> getSingleImageFile(String url, {int? height, int? width});
}
