import 'package:textile_mobile_app/data/datasources/firestore_catalog_datasource.dart';
import 'package:textile_mobile_app/data/models/banner_model.dart';
import 'package:textile_mobile_app/data/models/category_model.dart';
import 'package:textile_mobile_app/data/models/product_model.dart';

class CatalogRepository {
  CatalogRepository(this._dataSource);

  final FirestoreCatalogDataSource _dataSource;

  Stream<List<ProductModel>> watchProducts() => _dataSource.watchProducts();

  Stream<List<CategoryModel>> watchCategories() =>
      _dataSource.watchCategories();

  Stream<List<BannerModel>> watchBanners() => _dataSource.watchBanners();

  Future<ProductModel?> getProduct(String id) => _dataSource.getProduct(id);

  Stream<List<ProductModel>> watchAllProducts() =>
      _dataSource.watchAllProducts();

  Future<void> upsertProduct(ProductModel product) =>
      _dataSource.upsertProduct(product);

  Future<void> deleteProduct(String id) => _dataSource.deleteProduct(id);

  Future<void> upsertCategory(CategoryModel category) =>
      _dataSource.upsertCategory(category);

  Future<void> upsertBanner(BannerModel banner) =>
      _dataSource.upsertBanner(banner);
}
