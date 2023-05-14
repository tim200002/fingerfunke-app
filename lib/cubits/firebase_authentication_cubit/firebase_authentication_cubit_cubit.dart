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

/// This Cubit is responsible for handling the authentication state of the user
class FirebaseAuthenticationCubitCubit
    extends Cubit<FirebaseAuthenticationCubitState> {
  late final FirebaseAuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository = UserRepositoryImpl();

  // subscription to the firebase authentication state
  late final StreamSubscription<User?> _userSubscription;

  // subscription to the user document, returns the up to date state of the current user
  // whenever a user is authenticated
  StreamSubscription<user_models.User>? _userDocumentSubscription;

  // When a user logs in, these are all functions that must be run to safely login the user
  final Future<void> Function(user_models.User) onLogin;

  factory FirebaseAuthenticationCubitCubit(
      FirebaseAuthenticationRepository authenticationRepository,
      Future<void> Function(user_models.User) onLogin) {
    final currentUser = authenticationRepository.user;
    if (currentUser == null) {
      return FirebaseAuthenticationCubitCubit._hidden(authenticationRepository,
          const FirebaseAuthenticationCubitState.unauthenticated(), onLogin);
    } else {
      return FirebaseAuthenticationCubitCubit._hidden(
          authenticationRepository,
          FirebaseAuthenticationCubitState
              .authenticatedWaitingForUserToBeFetched(currentUser.uid),
          onLogin);
    }
  }

  /// Private constructor to simplify initial setup
  ///
  /// This constructor is only called by the factory constructor,
  /// it automatically subscribes to the user stream
  /// One must provide an initial state, which is used when the cubit is constructed
  FirebaseAuthenticationCubitCubit._hidden(
      FirebaseAuthenticationRepository authenticationRepository,
      FirebaseAuthenticationCubitState initialAuthenticationState,
      this.onLogin)
      : super(initialAuthenticationState) {
    _authenticationRepository = authenticationRepository;
    _userSubscription = _authenticationRepository.userStream
        .listen((currentUser) => _userChanged(currentUser));
  }

  Future<void> _userChanged(User? currentUser) async {
    // User Logged out this transition is always ok
    if (currentUser == null) {
      return emit(const FirebaseAuthenticationCubitState.unauthenticated());
    }

    // User Logged in transition is only valid if the user was previously logged out
    // bool previousStateIsLoggedOut =
    //     state.maybeMap(unauthenticated: (_) => true, orElse: () => false);
    // if (!previousStateIsLoggedOut) {
    //   throw Exception(
    //       'Invalid State Transition, please investigate how this could happen');
    // }

    Tuple2<bool, user_models.User?> userExists =
        await _userDocumentExists(currentUser.uid);
    if (userExists.item1 == false) {
      return emit(FirebaseAuthenticationCubitState.autehnticationNoUserCreated(
          currentUser.uid));
    }

    // to reduce latency we can already emit the previously fetched user
    final user_models.User authenticatedUser = userExists.item2!;
    // do all the required work for a new login
    await onLogin(authenticatedUser);
    emit(FirebaseAuthenticationCubitState.authenticated(authenticatedUser));

    // setup a subscription for the current user
    _createUserDocumentSubscription(authenticatedUser);
  }

  /// Checks if the user document exists in firestore, if it does it returns the user
  Future<Tuple2<bool, user_models.User?>> _userDocumentExists(
      String uid) async {
    final user = await _userRepository.getUser(uid);
    if (user == null) {
      return const Tuple2(false, null);
    }
    return Tuple2(true, user);
  }

  /// Creates a user document for the currently authenticated user in firestore
  Future<void> createUserDocument({required String name}) async {
    // Must only be called in the authenticationNoUserCreateState
    late final String uid;
    if (state.maybeWhen(
        autehnticationNoUserCreated: (tempUid) {
          uid = tempUid;
          return false;
        },
        orElse: () => true)) {
      throw Exception(
          'Invalid State Transition, please investigate how this could happen');
    }

    // create user
    final user_models.User user = user_models.User(id: uid, name: name);
    await _userRepository.createUser(user);

    // do all the required work for a new login
    await onLogin(user);

    // to reduce latency we can already emit the previously fetched user
    emit(FirebaseAuthenticationCubitState.authenticated(user));

    // setup a subscription for the current user
    _createUserDocumentSubscription(user);
  }

  /// Try to log out when a log out is requested
  Future<void> logoutRequested() async {
    await _authenticationRepository.logOut();
    await _userDocumentSubscription?.cancel();
  }

  /// Try to delete a user when requested
  Future<void> deleteAccountRequested() async {
    await _authenticationRepository.deleteAccount();
    await _userDocumentSubscription?.cancel();
  }

  Future<void> _createUserDocumentSubscription(user_models.User user) async {
    // check if old subscription exists, if so cancel
    await _userDocumentSubscription?.cancel();

    // create new subscription
    _userDocumentSubscription =
        _userRepository.getUserSubscription(user.id).listen((user) {
      emit(FirebaseAuthenticationCubitState.authenticated(user));
    });
  }

  /// Quick access to get user
  ///
  /// Obviously a user can only be received if we are in the authenticated state
  /// This function assumes this and throws an exception if it is not the case
  user_models.User getUser() {
    return state.maybeWhen(
        authenticated: (user) => user,
        orElse: () => throw InvalidStateException());
  }

  /// helper function to build around an authenticated user with quick access to the user
  static Widget userBuilder(Widget Function(user_models.User user) builder) {
    return BlocBuilder<FirebaseAuthenticationCubitCubit,
        FirebaseAuthenticationCubitState>(
      builder: (context, state) => state.maybeWhen(
        authenticated: ((user) => builder(user)),
        orElse: () => throw InvalidStateException(),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _userDocumentSubscription?.cancel();
    return super.close();
  }
}
