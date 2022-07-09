import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/user/user.dart';
import '../../repositories/user_repository/user_repository.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  late final StreamSubscription<User> _userSubscription;
  final UserRepository _userRepository = UserRepositoryImpl();

  AppCubit(User user) : super(AppState(user: user)) {
    _userSubscription =
        _userRepository.getUserSubscription(user.id).listen((user) {
      emit(state.copyWith(user: user));
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
