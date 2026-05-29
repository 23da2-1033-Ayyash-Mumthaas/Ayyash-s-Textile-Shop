import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textile_mobile_app/core/constants/firestore_paths.dart';
import 'package:textile_mobile_app/utils/firestore_helpers.dart';
import 'package:textile_mobile_app/data/models/order_model.dart';

class FirestoreOrderDataSource {
  FirestoreOrderDataSource(this._db);

  final FirebaseFirestore _db;

  Stream<List<OrderModel>> watchUserOrders(String userId) {
    return _db
        .collection(FirestorePaths.orders)
        .where('userId', isEqualTo: userId)
        .orderBy('placedAt', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => OrderModel.fromJson(d.dataWithId()))
              .toList(),
        );
  }

  Future<String> createOrder(OrderModel order) async {
    final ref = _db.collection(FirestorePaths.orders).doc();
    final data = order.copyWith(id: ref.id).toJson()
      ..remove('id')
      ..['placedAt'] = FieldValue.serverTimestamp()
      ..['updatedAt'] = FieldValue.serverTimestamp();
    await ref.set(data);
    return ref.id;
  }

  Stream<List<OrderModel>> watchAllOrders() {
    return _db
        .collection(FirestorePaths.orders)
        .orderBy('placedAt', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => OrderModel.fromJson(d.dataWithId()))
              .toList(),
        );
  }

  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
    String note = '',
  }) async {
    final ref = _db.collection(FirestorePaths.orders).doc(orderId);
    await ref.update({
      'status': status.name,
      'updatedAt': FieldValue.serverTimestamp(),
      'timeline': FieldValue.arrayUnion([
        {'status': status.name, 'at': Timestamp.now(), 'note': note},
      ]),
    });
  }
}
