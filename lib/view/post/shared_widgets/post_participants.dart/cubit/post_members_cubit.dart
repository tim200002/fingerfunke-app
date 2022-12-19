import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/post/post.dart';
import '../../../../../../models/user/user.dart';
import '../../../../../../repositories/post_repository/post_repository.dart';
import '../../../../../../repositories/post_repository/post_repository.impl.dart';

part 'post_members_state.dart';
part 'post_members_cubit.freezed.dart';

class PostMembersCubit extends Cubit<PostMembersState> {
  final PostRepository _postRepository = PostRepositoryImpl();

  final Post post;
  PostMembersCubit(this.post) : super(const PostMembersState.loading()) {
    refresh();
  }

  void refresh() {
    emit(const PostMembersState.loading());
    _postRepository.getPostMembers(post).then(
        (members) => emit(PostMembersState.neutral(members)),
        onError: (e) => emit(PostMembersState.error(e)));
  }
}
