import 'package:flutter/foundation.dart';
import 'package:textile_mobile_app/models/product.dart';
import 'package:textile_mobile_app/services/dummy_data.dart';

class ProductProvider extends ChangeNotifier {
  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<Product> get allProducts => DummyData.products;
  List<String> get categories => ['All', ...DummyData.categoryIcons.keys];

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
