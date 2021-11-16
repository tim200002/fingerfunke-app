part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  /// waiting to see if user is authenticated or not on app start
  const factory AuthenticationState.uninitialized() = _Unintialized;

  const factory AuthenticationState.unauthenticated() = _Unaunthenticated;

  const factory AuthenticationState.signedInAnonymously() =
      _SignedInAnonymously;

  const factory AuthenticationState.signedIn({required User user}) = _SignedIn;

  const factory AuthenticationState.signedInButNoUserDocumentCreated(
      {required String userId}) = _SignedInButNoUserDocumentCreated;
}
