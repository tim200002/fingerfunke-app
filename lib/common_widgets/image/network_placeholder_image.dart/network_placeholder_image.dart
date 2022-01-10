import 'package:fingerfunke_app/common_widgets/image/cubit/network_image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class NetworkPlaceholderImage extends StatelessWidget {
  final Link imageUrl;
  final Widget placeholder;
  final int? height;
  final int? width;
  final BoxFit? fit;
  const NetworkPlaceholderImage(this.imageUrl, this.placeholder,
      {Key? key, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkImageCubit(imageUrl),
      child: Builder(
        builder: (context) => SizedBox(
          width: width?.toDouble(),
          height: height?.toDouble(),
          child: BlocBuilder<NetworkImageCubit, NetworkImageState>(
            builder: (context, state) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: state.when(
                loading: () => placeholder,
                imageLoaded: (file) => Image(
                  image: FileImage(file),
                  fit: fit,
                  width: width?.toDouble(),
                  height: height?.toDouble(),
                ),
                error: (error) => ErrorWidget(error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
