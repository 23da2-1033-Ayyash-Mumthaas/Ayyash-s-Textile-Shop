import 'package:flutter/foundation.dart';
import 'package:textile_mobile_app/models/cart_item.dart';
import 'package:textile_mobile_app/models/order.dart';

class OrderProvider extends ChangeNotifier {
  final List<ShopOrder> _orders = [];

  List<ShopOrder> get orders => List.unmodifiable(_orders);

  void placeOrder({
    required List<CartItem> cartItems,
    required String deliveryAddress,
  }) {
    if (cartItems.isEmpty) return;
    final copiedItems = cartItems
        .map((item) => CartItem(product: item.product, quantity: item.quantity))
        .toList();

    _orders.insert(
      0,
      ShopOrder(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: copiedItems,
        placedAt: DateTime.now(),
        deliveryAddress: deliveryAddress,
      ),
    );
    notifyListeners();
  }
}
