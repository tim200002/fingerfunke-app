import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/user_repository/user_repository.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_state.dart';
part 'create_account_cubit.freezed.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final FirestoreId userId;
  final UserRepository _userRepository = UserRepositoryImpl();
  CreateAccountCubit({required this.userId})
      : super(const CreateAccountState(name: ""));

  void onUpdateUserName(String name) {
    emit(state.copyWith(name: name, inputValid: _validate()));
  }

  bool _validate() {
    if (state.name.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> createUser() async {
    final User user = User(id: userId, name: state.name);
    await _userRepository.createUser(user);
  }
}
