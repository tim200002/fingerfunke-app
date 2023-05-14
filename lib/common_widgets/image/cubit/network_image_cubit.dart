import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../cache/media_cache/media_cache.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'network_image_state.dart';
part 'network_image_cubit.freezed.dart';

class NetworkImageCubit extends Cubit<NetworkImageState> {
  final String url;
  final int? height;
  final int? width;

  final MediaCache _mediaCache = GetIt.I<MediaCache>();

  NetworkImageCubit(this.url, {this.height, this.width})
      : super(const NetworkImageState.loading()) {
    
    // handle base64 data Urls
    if (url.contains('base64')) {
      String shortendUrl = url.split(',')[1];
      Uint8List decodedBytes = base64Decode(shortendUrl);
      ImageProvider<Object> image = MemoryImage(decodedBytes);
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

  void _secureEmit(NetworkImageState state) {
    if (isClosed) {
      return;
    }

    return emit(state);
  }
}
