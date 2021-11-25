import 'package:flutter_cache_manager/file.dart';

abstract class MediaCache {
  Future<File> getSingleFile(String url);

  Future<File> getSingleImageFile(String url, {int? maxHeight, int? maxWidth});
}
