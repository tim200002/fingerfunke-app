import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/authentication_repository/authetication_repository.dart';
import 'package:fingerfunke_app/repositories/user_repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AutheticationRepository _autheticationRepository;
  final UserRepository _userRepository;

  final List<Function(AuthenticationState)> _listeners = [];

  AuthenticationCubit(
      {AutheticationRepository? authenticationRepository,
      UserRepository? userRepository})
      : _autheticationRepository =
            authenticationRepository ?? AuthenticaionRepositoryImpl(),
        _userRepository = userRepository ?? UserRepositoryImpl(),
        super(const AuthenticationState.uninitialized()) {
    forceNewState();

    // subscribe to changes in the authentication state
    _autheticationRepository
        .getSignInStateStream()
        .listen((SIGN_IN_STATE signInState) async {
      //! ToDo Error Handling
      AuthenticationState authenticationState =
          await _mapSignInStateToState(signInState);
      emit(authenticationState);
      _notifyListeners(authenticationState);
    });
  }

  /// It is not possible to use a bloc listener to listen to state changes in pur specific case
  /// a bloc listener would miss some state changes
  /// Therfore we provide out listeners to the bloc [onNewState] and with every state change
  /// we call these listeners ourself
  ///
  /// ToDo Can this be solved a better way
  /// ToDo in the debugger why are there so many closure
  void connectListener(Function(AuthenticationState) onNewState) {
    _listeners.add(onNewState);
  }

  void forceNewState() async {
    final SIGN_IN_STATE signInState = _autheticationRepository.getSignInState();
    _mapSignInStateToState(signInState).then((autheticationState) {
      emit(autheticationState);
      _notifyListeners(autheticationState);
    });
  }

  Future<void> signOut() async {
    await _autheticationRepository.signOut();
  }

  void _notifyListeners(AuthenticationState state) {
    for (var observer in _listeners) {
      observer(state);
    }
  }

  Future<AuthenticationState> _mapSignInStateToState(
      SIGN_IN_STATE signInState) async {
    switch (signInState) {
      case SIGN_IN_STATE.unauthenticated:
        {
          return const AuthenticationState.unauthenticated();
        }
      case SIGN_IN_STATE.signedInAnonymously:
        {
          return const AuthenticationState.signedInAnonymously();
        }

      case SIGN_IN_STATE.signedIn:
        {
          final FirestoreId? userID = _autheticationRepository.getUserId();
          if (userID != null) {
            try {
              final User user = await _userRepository.getUser(userID);
              return AuthenticationState.signedIn(user: user);
            } on UserNotFoundException catch (_) {
              return AuthenticationState.signedInButNoUserDocumentCreated(
                  userId: userID);
            } catch (e) {
              //! Todo
              rethrow;
            }
          } else {
            //! Das ist jetzt böse. Ich bin offiziell signed In aber keine ID
            //! Ds ist ein Error der die App zum absturz bringen kann
            throw Error();
          }
        }
    }
  }
}
