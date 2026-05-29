import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textile_mobile_app/core/constants/firestore_paths.dart';
import 'package:textile_mobile_app/utils/firestore_helpers.dart';
import 'package:textile_mobile_app/data/models/banner_model.dart';
import 'package:textile_mobile_app/data/models/category_model.dart';
import 'package:textile_mobile_app/data/models/product_model.dart';

class FirestoreCatalogDataSource {
  FirestoreCatalogDataSource(this._db);

  final FirebaseFirestore _db;

  Stream<List<ProductModel>> watchProducts() {
    return _db
        .collection(FirestorePaths.products)
        .where('isActive', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => ProductModel.fromJson(d.dataWithId()))
              .toList(),
        );
  }

  Stream<List<CategoryModel>> watchCategories() {
    return _db
        .collection(FirestorePaths.categories)
        .where('isActive', isEqualTo: true)
        .orderBy('sortOrder')
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => CategoryModel.fromJson(d.dataWithId()))
              .toList(),
        );
  }

  Stream<List<BannerModel>> watchBanners() {
    return _db
        .collection(FirestorePaths.banners)
        .where('isActive', isEqualTo: true)
        .orderBy('sortOrder')
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => BannerModel.fromJson(d.dataWithId()))
              .toList(),
        );
  }

  Future<ProductModel?> getProduct(String id) async {
    final doc = await _db.collection(FirestorePaths.products).doc(id).get();
    if (!doc.exists) return null;
    return ProductModel.fromJson(doc.dataWithId());
  }

  Stream<List<ProductModel>> watchAllProducts() {
    return _db
        .collection(FirestorePaths.products)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => ProductModel.fromJson(d.dataWithId()))
              .toList(),
        );
  }

  Future<void> upsertProduct(ProductModel product) async {
    final data = product.toJson()
      ..remove('id')
      ..remove('createdAt')
      ..['updatedAt'] = FieldValue.serverTimestamp();
    await _db
        .collection(FirestorePaths.products)
        .doc(product.id)
        .set(data, SetOptions(merge: true));
  }

  Future<void> deleteProduct(String id) async {
    await _db.collection(FirestorePaths.products).doc(id).update({
      'isActive': false,
    });
  }

  Future<void> upsertCategory(CategoryModel category) async {
    final data = category.toJson()
      ..remove('id')
      ..remove('createdAt')
      ..['updatedAt'] = FieldValue.serverTimestamp();
    await _db
        .collection(FirestorePaths.categories)
        .doc(category.id)
        .set(data, SetOptions(merge: true));
  }

  Future<void> upsertBanner(BannerModel banner) async {
    final data = banner.toJson()
      ..remove('id')
      ..remove('startsAt')
      ..remove('endsAt');
    await _db
        .collection(FirestorePaths.banners)
        .doc(banner.id)
        .set(data, SetOptions(merge: true));
  }
}
