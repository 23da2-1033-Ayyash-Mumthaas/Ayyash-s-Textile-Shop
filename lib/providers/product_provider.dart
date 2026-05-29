import 'package:flutter/foundation.dart';
import 'package:textile_mobile_app/data/mappers/product_mapper.dart';
import 'package:textile_mobile_app/data/models/product_model.dart';
import 'package:textile_mobile_app/models/product.dart';

class ProductProvider extends ChangeNotifier {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  final ProductMapper _mapper = const ProductMapper();

  List<Product> _products = [];

  void setFromFirestore(List<ProductModel> models) {
    _products = models.map(_mapper.toLegacy).toList();
    notifyListeners();
  }

  List<Product> get allProducts => _products;
  List<String> get categories {
    final names = _products.map((p) => p.category).toSet().toList()..sort();
    return ['All', ...names];
  }

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  String _normalize(String value) {
    return value.toLowerCase().replaceAll(' ', '');
  }

  List<Product> get filteredProducts {
    final query = _normalize(_searchQuery);
    return allProducts.where((product) {
      final categoryMatch =
          _selectedCategory == 'All' || product.category == _selectedCategory;
      final queryMatch = _normalize(product.name).contains(query);
      return categoryMatch && queryMatch;
    }).toList();
  }

  List<Product> get featuredProducts =>
      allProducts.where((product) => product.isFeatured).toList();

  List<Product> get trendingProducts =>
      allProducts.where((product) => product.isTrending).toList();

  List<Product> similarProducts(Product selected) {
    return allProducts
        .where((p) => p.id != selected.id && p.category == selected.category)
        .toList();
  }
}
