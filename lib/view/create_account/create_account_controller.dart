import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/user_repository/user_repository.dart';

class CreateAccountController {
  final UserRepository _userRepository = UserRepositoryImpl();
  void createUser(
      {required String name,
      required AuthenticationCubit authenticationCubit}) async {
    authenticationCubit.state.whenOrNull(
      signedInButNoUserDocumentCreated: (userId) async {
        final User user = User(id: userId, name: name);
        await _userRepository.createUser(user);
        authenticationCubit.forceNewState();
      },
    );
  }
}
