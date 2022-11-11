import 'dart:io';

import 'package:dio/dio.dart';

import '../../models/asset/asset.dart';
import '../../utils/type_aliases.dart';

abstract class VideoRepository {
  Future<JsonMap> createVideoAsset();

  VideoUploadResponse uploadVideo(File video, String uploadUrl,
      {Function(int, int)? onSendProgress});

  Stream<VideoAsset> subscribeToTemporaryAsset(String id);

  Future<void> deleteTemporaryAsset(String id);

  String createPlaybackUrl(VideoAsset video);

  String createThumbnailUrl(VideoAsset video,
      {int? height, int? width, bool smartcrop = false});
}

class VideoUploadResponse {
  final CancelToken cancelToken;
  final Future<Response<dynamic>> response;

  VideoUploadResponse({required this.cancelToken, required this.response});
}
