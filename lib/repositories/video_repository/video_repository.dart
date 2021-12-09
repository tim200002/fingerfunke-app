import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';

abstract class VideoRepository{
  Future<Map<String, dynamic>> createVideoAsset();

  VideoUploadResponse uploadVideo(File video, String uploadUrl);

  Stream<VideoAsset> subscribeToTemporaryAsset(String id);
}


class VideoUploadResponse{
  final Stream<int> progress;
  final CancelToken cancelToke;
  final Future<Response<dynamic>> response;

  VideoUploadResponse({required this.progress, required this.cancelToke, required this.response});
}