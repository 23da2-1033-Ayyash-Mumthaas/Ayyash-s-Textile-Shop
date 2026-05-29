import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textile_mobile_app/core/constants/firestore_paths.dart';
import 'package:textile_mobile_app/utils/firestore_helpers.dart';
import 'package:textile_mobile_app/data/models/admin_model.dart';

class FirestoreAdminDataSource {
  FirestoreAdminDataSource(this._db);

  final FirebaseFirestore _db;

  Future<bool> isAdmin(String uid) async {
    final doc = await _db.collection(FirestorePaths.admins).doc(uid).get();
    if (!doc.exists) return false;
    final admin = AdminModel.fromJson(doc.dataWithId());
    return admin.isActive;
  }

  Future<AdminModel?> getAdmin(String uid) async {
    final doc = await _db.collection(FirestorePaths.admins).doc(uid).get();
    if (!doc.exists) return null;
    return AdminModel.fromJson(doc.dataWithId());
  }
}
