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
      {String? name, ImageAsset? picture, int? age}) async {
    final Map<String, dynamic> updateMap = {
      'name': name,
      'picture': picture?.toJson(),
      'age': age
    }..removeWhere((key, value) => value == null);
    await _userCollection.doc(userId).update(updateMap);
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
