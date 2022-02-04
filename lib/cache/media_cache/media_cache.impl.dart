import 'dart:async';

import 'package:fingerfunke_app/cache/media_cache/media_cache.dart';
import 'package:flutter/material.dart';
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
  Future<ImageProvider> getSingleImageFile(String url, {int? height, int? width})  async {
    final imageFile = await _cacheManager.getSingleFile(url);
    final imageProvider = FileImage(imageFile);
    if(height == null && width == null){
      return imageProvider;
    }else {
      return ResizeImage(imageProvider, width: width, height: height, allowUpscaling: false);
    }
  }
}
