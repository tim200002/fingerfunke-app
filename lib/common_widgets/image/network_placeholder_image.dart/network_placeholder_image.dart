import '../../../utils/tools.dart';
import '../cubit/network_image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import '../../../utils/type_aliases.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NetworkPlaceholderImage extends StatelessWidget {
  final Link imageUrl;
  final Widget placeholder;
  final int? height;
  final int? width;
  final int transitionMs;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  const NetworkPlaceholderImage(this.imageUrl, this.placeholder,
      {Key? key,
      this.height,
      this.width,
      this.fit,
      this.transitionMs = 200,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkImageCubit(imageUrl),
      child: Builder(
        builder: (context) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: borderRadius),
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
                error: (error) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        FeatherIcons.alertCircle,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        l10n(context).lbl_imageLoadError,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
