part of 'network_image_cubit.dart';

@freezed
class NetworkImageState with _$NetworkImageState {
  const factory NetworkImageState.loading() = _Loading;
  const factory NetworkImageState.imageLoaded(File image) = _ImageLoaded;
  const factory NetworkImageState.error(Object error) = _Error;
}
