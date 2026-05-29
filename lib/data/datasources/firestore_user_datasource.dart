import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textile_mobile_app/core/constants/firestore_paths.dart';
import 'package:textile_mobile_app/utils/firestore_helpers.dart';
import 'package:textile_mobile_app/data/models/user_model.dart';
import 'package:textile_mobile_app/data/models/wishlist_model.dart';

class FirestoreUserDataSource {
  FirestoreUserDataSource(this._db);

  final FirebaseFirestore _db;

  Future<UserModel?> getUser(String uid) async {
    final doc = await _db.collection(FirestorePaths.users).doc(uid).get();
    if (!doc.exists) return null;
    return UserModel.fromJson(doc.dataWithId());
  }

  Future<void> upsertUser(UserModel user) async {
    final data = user.toJson()
      ..remove('id')
      ..['updatedAt'] = FieldValue.serverTimestamp();
    if (user.createdAt == null) {
      data['createdAt'] = FieldValue.serverTimestamp();
    }
    await _db.collection(FirestorePaths.users).doc(user.id).set(data, SetOptions(merge: true));
  }

  Stream<WishlistModel?> watchWishlist(String userId) {
    return _db.collection(FirestorePaths.wishlists).doc(userId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return WishlistModel.fromJson(doc.dataWithId());
    });
  }
}
