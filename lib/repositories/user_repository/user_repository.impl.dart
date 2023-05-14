part of './user_repository.dart';

/// Implementation of the [UserRepository] interface.
/// 
/// Implemented are methods to access users from the database.
/// Subscribing to users using streams is also implemented
/// 
/// For one time reads, the repo uses a cache to avoid unnecessary reads from the database.
class UserRepositoryImpl implements UserRepository {
  final GetIt _getIt = GetIt.instance;
  late final FirebaseFirestore _firestore;
  late final LRUCache<User> _userCache;
  late final CollectionReference _userCollection;

  UserRepositoryImpl() {
    _firestore = _getIt<FirebaseFirestore>();
    _userCollection = _firestore.collection('users');
    _userCache = _getIt<LRUCache<User>>();
  }

  @override
  Future<User?> getUser(String userId) async {
    // check whether the user is already in the cache, if so use that
    if (_userCache.containsKey(userId)) {
      return  _userCache.get(userId);
    }

    // user is not in cache, fetch new user from the repository
    DocumentSnapshot userSnaphsot = await _userCollection.doc(userId).get();
    if (userSnaphsot.data() == null) {
      return null;
    }
    final user = User.fromDoc(userSnaphsot);

    // add user to cache
    _userCache.put(userId, user);
    return user;
  }

  @override
  Future<void> createUser(User user) async {
    // create user in database
    await _userCollection.doc(user.id).set(user.toJson()..remove("clearance"));
    
    // add user to cache 
    _userCache.put(user.id, user);
  }

  @override
  Future<void> updateUser(FirestoreId userId,
      {String? name,
      String? picture,
      int? age,
      List<FirestoreId>? savedPosts,
      Map<String, String>? socialMedia,
      String? bio}) async {
    // create updated version of user
    final JsonMap updateMap = {
      'name': name,
      'picture': picture,
      'age': age,
      'savedPosts': savedPosts,
      'socialMedia': socialMedia,
      'bio': bio
    }
    // remove null values
    ..removeWhere((key, value) => value == null);

    //  update user in database
    await _userCollection.doc(userId).update(updateMap);

    // update user from the update map
    final upd = _userCache.get(userId)!.copyWith(
        name: name,
        picture: picture,
        age: age,
        savedPosts: savedPosts,
        socialMedia: socialMedia,
        bio: bio);
    
    // update user in cache
    _userCache.put(userId, upd);
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

      // update user in cache 
      final user = User.fromDoc(documentSnapshot);
      _userCache.put(userId, user);
      
      return user;
    });
  }

  @override
  Future<void> setToken(String userId, String key, JsonMap value) {
    return _userCollection.doc(userId).collection("tokens").doc(key).set(value);
  }

  @override
  Future<void> setSessionInfo(FirestoreId userId, JsonMap infos) =>
      _userCollection
          .doc(userId)
          .collection("personal")
          .doc("sessionInfo")
          .set(infos, SetOptions(merge: true));
}
