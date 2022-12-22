import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/user/user.dart';
import '../../repositories/user_repository/user_repository.dart';
import '../../services/notification_service.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  late final StreamSubscription<User> _userSubscription;
  final UserRepository _userRepository = UserRepositoryImpl();

  AppCubit(User user) : super(AppState(user: user)) {
    _subscribe(user.id);
  }

  void _subscribe(String userId) {
    _userSubscription =
        _userRepository.getUserSubscription(userId).listen((user) {
      emit(state.copyWith(user: user));
    });
  }

  // should be called from where the provider is defined
  // running it with the cubit itself leads to problems with lazy execution
  // of the blocproviders
  static Future<void> setUserVars(String userId) async {
    var fcmToken = await FirebaseMessaging.instance.getToken();
    await NotificationService.setFCMToken(userId, fcmToken);
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
