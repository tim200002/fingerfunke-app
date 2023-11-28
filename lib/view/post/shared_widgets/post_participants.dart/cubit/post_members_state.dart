part of 'post_members_cubit.dart';

@freezed
class PostMembersState with _$PostMembersState {
  const factory PostMembersState.loading() = _L;
  const factory PostMembersState.error(dynamic e) = _E;
  const factory PostMembersState.neutral(List<UserInfo> members) = _N;
}
