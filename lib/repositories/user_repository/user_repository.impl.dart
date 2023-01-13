part of './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore _firestore;
  late final CollectionReference _userCollection;

  UserRepositoryImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    _userCollection = _firestore.collection('users');
  }

  @override
  Future<User> getUser(String userId) async {
    DocumentSnapshot userSnaphsot = await _userCollection.doc(userId).get();
    if (userSnaphsot.data() == null) {
      throw UserNotFoundException();
    }
    return User.fromDoc(userSnaphsot);
  }

  @override
  Future<void> createUser(User user) async {
    await _userCollection.doc(user.id).set(user.toJson()..remove("clearance"));
  }

  @override
  Future<void> updateUser(FirestoreId userId,
      {String? name,
      String? picture,
      int? age,
      List<FirestoreId>? savedPosts,
      Map<String, String>? socialMedia,
      String? bio}) async {
    final JsonMap updateMap = {
      'name': name,
      'picture': picture,
      'age': age,
      'savedPosts': savedPosts,
      'socialMedia': socialMedia,
      'bio': bio
    }..removeWhere((key, value) => value == null);
    await _userCollection.doc(userId).update(updateMap);
  }

  @override
  Future<void> savePost(FirestoreId userId, FirestoreId postId) {
    return _userCollection.doc(userId).update({
      "savedPosts": FieldValue.arrayUnion([postId])
    });
  }

  @override
  Future<void> unsavePost(FirestoreId userId, FirestoreId postId) {
    return _userCollection.doc(userId).update({
      "savedPosts": FieldValue.arrayRemove([postId])
    });
  }

  @override
  Stream<User> getUserSubscription(String userId) {
    return _userCollection.doc(userId).snapshots().map((documentSnapshot) {
      if (documentSnapshot.data() == null) {
        throw UserNotFoundException();
      }
      return User.fromDoc(documentSnapshot);
    });
  }

  @override
  Future<void> setToken(String userId, String key, JsonMap value) {
    return _userCollection.doc(userId).collection("tokens").doc(key).set(value);
  }

  @override
  Future<void> setSessionInfo(FirestoreId userId, SessionInfo sessionInfo) =>
      _userCollection
          .doc(userId)
          .collection("personal")
          .doc("sessionInfo")
          .set(sessionInfo.toJson());
}
