import 'package:fingerfunke_app/common_widgets/image/cubit/network_image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class NetworkPlaceholderImage extends StatelessWidget {
  final Link imageUrl;
  final Widget placeholder;
  final int? height;
  final int? width;
  final int transitionMs;
  final BoxFit? fit;
  const NetworkPlaceholderImage(this.imageUrl, this.placeholder,
      {Key? key, this.height, this.width, this.fit, this.transitionMs = 200})
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
              duration: Duration(milliseconds: transitionMs),
              child: state.when(
                loading: () => placeholder,
                imageLoaded: (file) => Image(
                  image: file,
                  fit: fit,
                  width: width?.toDouble() ?? 1000,
                  height: height?.toDouble() ?? 1000, //TODO fix sizing issue
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
