part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.loading(FirestoreId postId) = _Loading;
  const factory PostState.normal(Post post, bool isMember) = _Normal;
}
