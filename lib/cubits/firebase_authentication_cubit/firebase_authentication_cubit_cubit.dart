import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart';

import '../../models/user/user.dart' as user_models;
import '../../repositories/firebase_authentication_repository/firebase_authentication_repository.dart';
import '../../repositories/user_repository/user_repository.dart';
import '../../utils/exceptions.dart';

part 'firebase_authentication_cubit_cubit.freezed.dart';
part 'firebase_authentication_cubit_state.dart';

class FirebaseAuthenticationCubitCubit
    extends Cubit<FirebaseAuthenticationCubitState> {
  late final FirebaseAuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository = UserRepositoryImpl();
  late final StreamSubscription<User?> _userSubscription;

  factory FirebaseAuthenticationCubitCubit(
      FirebaseAuthenticationRepository authenticationRepository) {
    final currentUser = authenticationRepository.user;
    if (currentUser == null) {
      return FirebaseAuthenticationCubitCubit._hidden(authenticationRepository,
          const FirebaseAuthenticationCubitState.unauthenticated());
    } else {
      return FirebaseAuthenticationCubitCubit._hidden(
          authenticationRepository,
          FirebaseAuthenticationCubitState
              .authenticatedWaitingForUserToBeFetched(currentUser.uid));
    }
  }

  FirebaseAuthenticationCubitCubit._hidden(
      FirebaseAuthenticationRepository authenticationRepository,
      FirebaseAuthenticationCubitState initialAuthenticationState)
      : super(initialAuthenticationState) {
    _authenticationRepository = authenticationRepository;
    _userSubscription = _authenticationRepository.userStream
        .listen((currentUser) => _userChanged(currentUser));
    // I think we dont need this sicne on stream subscription stream also emits at start
    // initialAuthenticationState.whenOrNull(
    //   authenticatedWaitingForUserToBeFetched: (uid) => _mapUserIdToState(uid),
    // );
  }

  void _userChanged(User? currentUser) {
    if (currentUser == null) {
      return emit(const FirebaseAuthenticationCubitState.unauthenticated());
    } else {
      emit(FirebaseAuthenticationCubitState
          .authenticatedWaitingForUserToBeFetched(currentUser.uid));
      _mapUserIdToState(currentUser.uid);
    }
  }

  Future<void> _mapUserIdToState(String uid) async {
    try {
      final user = await _userRepository.getUser(uid);
      return emit(FirebaseAuthenticationCubitState.authenticated(user));
    } on UserNotFoundException catch (_) {
      return emit(
          FirebaseAuthenticationCubitState.autehnticationNoUserCreated(uid));
    }
  }

  Future<void> createUserDocument({required String name}) async {
    await state.maybeWhen(
        autehnticationNoUserCreated: (uid) async {
          final user_models.User user = user_models.User(id: uid, name: name);
          await _userRepository.createUser(user);
          emit(FirebaseAuthenticationCubitState.authenticated(user));
        },
        orElse: () => throw InvalidStateException());
  }

  Future<void> logoutRequested() {
    return _authenticationRepository.logOut();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
