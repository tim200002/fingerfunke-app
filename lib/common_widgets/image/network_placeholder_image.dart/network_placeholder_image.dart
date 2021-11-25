import 'package:fingerfunke_app/cache/media_cache/media_cache.dart';
import 'package:flutter_cache_manager/file.dart';

import 'package:fingerfunke_app/cache/media_cache/media_cache.impl.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class NetworkPlaceholderImage extends StatelessWidget {
  final Link imageUrl;
  final MediaCache _mediaCache = MediaCacheImpl();
  final AssetImage placeholder;
  final int? height;
  final int? width;
  NetworkPlaceholderImage(this.imageUrl, this.placeholder,
      {Key? key, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.toDouble(),
      height: height?.toDouble(),
      child: FutureBuilder(
        future: _mediaCache.getSingleImageFile(imageUrl,
            maxHeight: height, maxWidth: width),
        builder: (context, AsyncSnapshot<File> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Image(
                image: placeholder,
              );
            case ConnectionState.done:
              {
                if (snapshot.hasError) {
                  return const Text("Error");
                } else {
                  return Image(
                    image: FileImage(snapshot.data!),
                  );
                }
              }
            default:
              return Text("Error");
          }
        },
      ),
    );
  }
}
