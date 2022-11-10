part of 'posts_list_cubit.dart';

@freezed
class PostsListState with _$PostsListState {
  const factory PostsListState.error(dynamic e) = _Error;
  const factory PostsListState.loading() = _Loading;
  const factory PostsListState.neutral(List<Post> posts) = _Neutral;
}
