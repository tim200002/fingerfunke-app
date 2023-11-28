part of 'firebase_authentication_cubit_cubit.dart';

@freezed
class FirebaseAuthenticationCubitState with _$FirebaseAuthenticationCubitState {
  const factory FirebaseAuthenticationCubitState.authenticatedWaitingForUserToBeFetched(
      String uid) = _AuthenticatedWaitingForUserToBeFetched;
  const factory FirebaseAuthenticationCubitState.autehnticationNoUserCreated(
      String uid) = _AuthenticatedNoUserCreated;
  const factory FirebaseAuthenticationCubitState.authenticated(
      user_models.User user) = _Authenticated;
  const factory FirebaseAuthenticationCubitState.unauthenticated() =
      _Unauthenticated;
}
