import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../models/asset/asset.dart';
import '../../../repositories/video_repository/video_repository.dart';
import '../cubit/network_image_cubit.dart';

/// This widget is used to display a thumbnail image of a video asset.
///
/// It supports loading a high resolution version of the image form mux.
/// However, while loading or if the image cannot be loaded a low quality blurred version
/// of the image is displayed. This blurred version stems from the base64 data URL that is embedded
/// in each video asset
class MuxThumbnailImage extends StatelessWidget {
  final VideoAsset _videoAsset;
  final VideoRepository _videoRepository = GetIt.I.get<VideoRepository>();
  final double? height;
  final double? width;
  final BoxFit? fit;
  MuxThumbnailImage(this._videoAsset, {this.height, this.width, this.fit, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NetworkImageCubit(_videoRepository.createThumbnailUrl(_videoAsset)),
      child: Builder(
          builder: (context) =>
              BlocBuilder<NetworkImageCubit, NetworkImageState>(
                builder: (context, state) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: state.when(
                      loading: () => _getImage(_getImageFromBase64DataUrl(
                          _videoAsset.thumbnailUrl!)),
                      imageLoaded: (img) => _getImage(img),
                      error: (error) => _getImage(_getImageFromBase64DataUrl(
                          _videoAsset.thumbnailUrl!))),
                ),
              )),
    );
  }

  ImageProvider<Object> _getImageFromBase64DataUrl(String base64DataUrl) {
    String shortendUrl = base64DataUrl.split(',')[1];
    Uint8List decodedBytes = base64Decode(shortendUrl);
    return MemoryImage(decodedBytes);
  }

  Image _getImage(ImageProvider<Object> imageProvider) {
    return Image(
      fit: fit,
      width: width,
      height: height,
      image: imageProvider,
    );
  }
}
