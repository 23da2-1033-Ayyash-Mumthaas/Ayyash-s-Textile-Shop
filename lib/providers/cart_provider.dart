import 'package:flutter/foundation.dart';
import 'package:textile_mobile_app/models/cart_item.dart';
import 'package:textile_mobile_app/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);
  bool get isEmpty => _items.isEmpty;

  double get totalAmount =>
      _items.fold(0, (total, item) => total + item.lineTotal);

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  void addToCart(Product product, {int quantity = 1, String size = ''}) {
    final index = _items.indexWhere(
      (item) => item.product.id == product.id && item.size == size,
    );
    if (index == -1) {
      _items.add(CartItem(product: product, quantity: quantity, size: size));
    } else {
      _items[index].quantity += quantity;
    }
    notifyListeners();
  }

  void updateQuantity(String productId, String size, int quantity) {
    final index = _items.indexWhere(
      (item) => item.product.id == productId && item.size == size,
    );
    if (index == -1) return;
    if (quantity <= 0) {
      _items.removeAt(index);
    } else {
      _items[index].quantity = quantity;
    }
    notifyListeners();
  }

  void removeItem(String productId, String size) {
    _items.removeWhere(
      (item) => item.product.id == productId && item.size == size,
    );
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
