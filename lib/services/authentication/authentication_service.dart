import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/user/user.dart' as user;

/// Singleton class to access current Authentication State everywhere without having to provide a context
///
/// The values are held up to date by the AuthenticationCubit via the [onAuthenticationStateChanged] function
/// However it only support one time reads not stream subscription
class AuthenticationService {
  user.User? _currentUser;
  AuthenticationState authenticationState =
      const AuthenticationState.uninitialized();

  AuthenticationService._();
  static final AuthenticationService _authenticationService =
      AuthenticationService._();

  factory AuthenticationService() => _authenticationService;

  /// get User or Null if not safe that user is given
  user.User? get currentUser {
    return _currentUser;
  }

  /// it it is definetly knwon that user exists, this returns an User object bur throws an exception if user does not exist
  user.User get currentUserSafe {
    if (_currentUser == null) {
      throw Exception(
          "Authentication repository asked for user even though no usex exists");
    } else {
      return _currentUser!;
    }
  }

  void onAuthenticationStateChanged(AuthenticationState state) {
    authenticationState = state;
    state.maybeWhen(
        signedIn: (user) => _currentUser = user,
        orElse: () => _currentUser = null);
  }
}
