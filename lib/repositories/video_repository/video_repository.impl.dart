import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

class VideoRepositoryImpl implements VideoRepository {
  final FirebaseFunctions _functions;
  final FirebaseFirestore _firestore;
  late final CollectionReference _temporaryCollection;
  final _dio = Dio();

  VideoRepositoryImpl(
      {FirebaseFunctions? functions, FirebaseFirestore? firestore})
      : _functions =
            functions ?? FirebaseFunctions.instanceFor(region: 'europe-west3'),
        _firestore = firestore ?? FirebaseFirestore.instance {
    _temporaryCollection = _firestore.collection('temporary_assets');
  }

  @override
  Future<Map<String, dynamic>> createVideoAsset() async {
    // ToDo Error Handling
    HttpsCallable callable = _functions.httpsCallable('mux-createMuxAsset');
    final results = await callable();
    return results.data;
  }

  @override
  VideoUploadResponse uploadVideo(File file, String uploadUrl) {
    CancelToken token = CancelToken();
    final StreamController<int> streamController = StreamController();
    final Options options =
        Options(contentType: lookupMimeType(file.path), headers: {
      'Accept': "*/*",
      'Content-Length': file.lengthSync().toString(),
      'Connection': 'keep-alive',
    });
    final response = _dio.put(uploadUrl,
        // ToDo find out if this stream is automatically closes when cancel token invoked
        data: file.openRead(),
        cancelToken: token,
        options: options, onSendProgress: (int sent, int total) {
      streamController.add(((sent / total) * 100).toInt());
      print(((sent / total) * 100).toInt());
    });

    return VideoUploadResponse(
        response: response,
        progress: streamController.stream,
        cancelToke: token);
  }

  @override
  Stream<VideoAsset> subscribeToTemporaryAsset(String id) {
    return _temporaryCollection
        .doc(id)
        .snapshots()
        .map((documentSnapshot) => VideoAsset.fromDoc(documentSnapshot));
  }

  @override
  Future<void> deleteTemporaryAsset(String id) {
    return _temporaryCollection.doc(id).delete();
  }

  @override
  String createPlaybackUrl(VideoAsset video) {
    return "https://stream.mux.com/${video.playbackId}.m3u8";
  }

  @override
  String createThumbnailUrl(VideoAsset video,
      {int? height, int? width, bool smartcrop = false}) {
    String url = "https://image.mux.com/${video.playbackId}/thumbnail.jpg?";
    if (height != null) {
      url += "height=$height&";
    }
    if (width != null) {
      url += "width=$width&";
    }
    if (smartcrop) {
      url += "fit_mode=smartcrop&";
    }
    return url;
  }
}
