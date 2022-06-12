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
  Future<void> updateUser(User updatedUser) async {
    await _userCollection
        .doc(updatedUser.id)
        .update(updatedUser.toJson()..remove("clearance"));
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
}
