import 'dart:async';

import 'package:fingerfunke_app/cache/media_cache/media_cache.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MediaCacheImpl implements MediaCache {
  final DefaultCacheManager _cacheManager;

  MediaCacheImpl(
      {DefaultCacheManager? cacheManager, ImageCacheManager? imageCacheManager})
      : _cacheManager = cacheManager ?? DefaultCacheManager();

  @override
  Future<File> getSingleFile(String url) => _cacheManager.getSingleFile(url);

  @override
  Future<File> getSingleImageFile(String url, {int? maxHeight, int? maxWidth}) {
    final Completer<File> completer = Completer();
    _cacheManager
        .getImageFile(url, maxHeight: maxHeight, maxWidth: maxWidth)
        .listen((FileResponse event) {
      if (event is FileInfo && !completer.isCompleted) {
        completer.complete(event.file);
      }
    });

    return completer.future;
  }
}
