import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/user/user.dart';

part 'user_repository.impl.dart';
part 'errors_and_exceptions.dart';

abstract class UserRepository {
  Future<User> getUser(String userId);
  Future<void> createUser(User user);
  Future<void> updateUser(User updatedUser);
}
