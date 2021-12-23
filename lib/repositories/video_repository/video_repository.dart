import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/user/user.dart';

abstract class VideoRepository {
  Future<Map<String, dynamic>> createVideoAsset();

  VideoUploadResponse uploadVideo(File video, String uploadUrl);

  Stream<VideoAsset> subscribeToTemporaryAsset(String id);

  Future<void> deleteTemporaryAsset(String id);

  String createPlaybackUrl(VideoAsset video);

  String createThumbnailUrl(VideoAsset video,{int? height, int? width, bool smartcrop = false});
}

class VideoUploadResponse {
  final Stream<int> progress;
  final CancelToken cancelToke;
  final Future<Response<dynamic>> response;

  VideoUploadResponse(
      {required this.progress,
      required this.cancelToke,
      required this.response});
}
