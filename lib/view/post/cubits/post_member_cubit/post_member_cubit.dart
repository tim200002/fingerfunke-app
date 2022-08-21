import '../../../../models/user/user.dart';
import '../../../../repositories/post_repository/post_repository.impl.dart';
import '../../../../utils/extensions/first_where_or_null.dart';
import '../../../../utils/util_cubits/stream/stream_subscribe_cubit.dart';

class PostMemberCubit extends StreamSubscribeCubit<List<UserInfo>> {
  String postId;
  UserInfo user;
  PostMemberCubit({required this.postId, required this.user})
      : super(dataStream: PostRepositoryImpl().observePostMembers(postId));

  /// requires an `AppCubit` instance within the context to work
  bool userIsMember() {
    return state.maybeWhen(
        orElse: () => false,
        neutral: (members) =>
            members.firstWhereOrNull((m) => m.id == user.id) != null);
  }

  Future<void> joinPost() =>
      PostRepositoryImpl().addPostMember(postId: postId, user: user);

  Future<void> leavePost() =>
      PostRepositoryImpl().removePostMember(postId: postId, userId: user.id);
}
