import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:textile_mobile_app/data/datasources/firestore_admin_datasource.dart';
import 'package:textile_mobile_app/data/datasources/firestore_catalog_datasource.dart';
import 'package:textile_mobile_app/data/datasources/firestore_order_datasource.dart';
import 'package:textile_mobile_app/data/datasources/firestore_settings_datasource.dart';
import 'package:textile_mobile_app/data/datasources/firestore_user_datasource.dart';
import 'package:textile_mobile_app/data/models/app_settings_model.dart';
import 'package:textile_mobile_app/data/models/banner_model.dart';
import 'package:textile_mobile_app/data/models/category_model.dart';
import 'package:textile_mobile_app/data/models/offer_model.dart';
import 'package:textile_mobile_app/data/models/order_model.dart';
import 'package:textile_mobile_app/data/models/product_model.dart';
import 'package:textile_mobile_app/data/repositories/catalog_repository.dart';
import 'package:textile_mobile_app/data/repositories/order_repository.dart';
import 'package:textile_mobile_app/data/repositories/settings_repository.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final db = ref.watch(firestoreProvider);
  return CatalogRepository(FirestoreCatalogDataSource(db));
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final db = ref.watch(firestoreProvider);
  return SettingsRepository(FirestoreSettingsDataSource(db));
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final db = ref.watch(firestoreProvider);
  return OrderRepository(FirestoreOrderDataSource(db));
});

final adminDataSourceProvider = Provider<FirestoreAdminDataSource>((ref) {
  return FirestoreAdminDataSource(ref.watch(firestoreProvider));
});

final userDataSourceProvider = Provider<FirestoreUserDataSource>((ref) {
  return FirestoreUserDataSource(ref.watch(firestoreProvider));
});

final productsStreamProvider = StreamProvider<List<ProductModel>>((ref) {
  return ref.watch(catalogRepositoryProvider).watchProducts();
});

final categoriesStreamProvider = StreamProvider<List<CategoryModel>>((ref) {
  return ref.watch(catalogRepositoryProvider).watchCategories();
});

final bannersStreamProvider = StreamProvider<List<BannerModel>>((ref) {
  return ref.watch(catalogRepositoryProvider).watchBanners();
});

final appSettingsStreamProvider = StreamProvider<AppSettingsModel>((ref) {
  return ref.watch(settingsRepositoryProvider).watchAppSettings();
});

final offersStreamProvider = StreamProvider<List<OfferModel>>((ref) {
  return ref.watch(settingsRepositoryProvider).watchActiveOffers();
});

final isAdminProvider = FutureProvider.family<bool, String>((ref, uid) async {
  return ref.watch(adminDataSourceProvider).isAdmin(uid);
});

final allProductsStreamProvider = StreamProvider<List<ProductModel>>((ref) {
  return ref.watch(catalogRepositoryProvider).watchAllProducts();
});

final allOrdersStreamProvider = StreamProvider<List<OrderModel>>((ref) {
  return ref.watch(orderRepositoryProvider).watchAllOrders();
});

final allOffersStreamProvider = StreamProvider<List<OfferModel>>((ref) {
  return ref.watch(settingsRepositoryProvider).watchAllOffers();
});
