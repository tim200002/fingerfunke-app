import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

part 'user_repository.impl.dart';
part 'errors_and_exceptions.dart';

abstract class UserRepository {
  Future<User> getUser(String userId);
  Future<void> createUser(User user);
  Future<void> updateUser(FirestoreId userId,
      {String? name, String? picture, int? age, List<FirestoreId>? savedPosts});

  Future<void> savePost(FirestoreId userId, FirestoreId postId);
  Future<void> unsavePost(FirestoreId userId, FirestoreId postId);

  Stream<User> getUserSubscription(String userId);
}
