import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user/user.dart';
import '../../utils/type_aliases.dart';

part 'errors_and_exceptions.dart';
part 'user_repository.impl.dart';

abstract class UserRepository {
  Future<User> getUser(String userId);
  Future<void> createUser(User user);
  Future<void> setToken(String userId, String key, Map<String, dynamic> value);
  Future<void> updateUser(FirestoreId userId,
      {String? name, String? picture, int? age, List<FirestoreId>? savedPosts});

  Future<void> savePost(FirestoreId userId, FirestoreId postId);
  Future<void> unsavePost(FirestoreId userId, FirestoreId postId);

  Stream<User> getUserSubscription(String userId);
}
