import 'package:fingerfunke_app/cache/media_cache/media_cache.dart';
import 'package:fingerfunke_app/common_widgets/image/cubit/network_image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final NetworkImageCubit cubit = NetworkImageCubit(imageUrl);
    return SizedBox(
      width: width?.toDouble(),
      height: height?.toDouble(),
      child: BlocBuilder<NetworkImageCubit, NetworkImageState>(
        bloc: cubit,
        builder: (context, state) => state.when(
          loading: () => Image(
            image: placeholder,
          ),
          imageLoaded: (file) => Image(image: FileImage(file)),
          error: (error) => ErrorWidget(error),
        ),
      ),
    );
  }
}
