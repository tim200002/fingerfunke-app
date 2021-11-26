part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.loading() = _Loading;
  const factory PostState.normal(Post post) = _Normal;
}
