import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/user/user.dart';
import '../../repositories/user_repository/user_repository.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _repository = UserRepositoryImpl();

  final String userId;
  UserCubit(this.userId) : super(const UserState.loading()) {
    refresh();
  }

  void refresh() {
    emit(const UserState.loading());
    _repository.getUser(userId).then((user) => emit(UserState.neutral(user)),
        onError: (e) => emit(UserState.error(e)));
  }
}
