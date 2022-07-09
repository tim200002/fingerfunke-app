part of 'saved_posts_cubit.dart';

@freezed
class SavedPostsState with _$SavedPostsState {
  const factory SavedPostsState.loading() = _Loading;
  const factory SavedPostsState.loadedButNothingSaved() = _LoadedButNohthingSaved;
  const factory SavedPostsState.loaded(List<Post> posts) = _Loaded;
}
