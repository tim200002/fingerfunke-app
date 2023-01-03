import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import '../../../cache/media_cache/media_cache.dart';
import '../../../cache/media_cache/media_cache.impl.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/tools.dart';

part 'network_image_state.dart';
part 'network_image_cubit.freezed.dart';

class NetworkImageCubit extends Cubit<NetworkImageState> {
  final String url;
  final int? height;
  final int? width;

  final MediaCache _mediaCache;

  NetworkImageCubit(this.url, {this.height, this.width, MediaCache? mediaCache})
      : _mediaCache = mediaCache ?? MediaCacheImpl(),
        super(const NetworkImageState.loading()) {
    // handle base64 data Urls
    if (url.contains('base64')) {
      String shortendUrl = url.split(',')[1];
      Uint8List decodedBytes = base64Decode(shortendUrl);
      ImageProvider<Object> image = MemoryImage(decodedBytes);
      logger.d("Network image cubit");
      _secureEmit(NetworkImageState.imageLoaded(image));
    }
    // handle images which are real files
    else {
      _mediaCache
          .getSingleImageFile(
            url,
          ) // maxHeight: height, maxWidth: width)
          .then((image) => _secureEmit(NetworkImageState.imageLoaded(image)),
              onError: (e) => _secureEmit(NetworkImageState.error(e)))
          .catchError((error, stacktrace) {
        _secureEmit(NetworkImageState.error(error));
      });
    }
  }

  void _secureEmit(NetworkImageState state){
    if(isClosed){
      return;
    }

    return emit(state);
  }
}
