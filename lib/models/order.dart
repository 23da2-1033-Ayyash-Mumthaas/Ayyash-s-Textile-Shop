import 'package:textile_mobile_app/models/cart_item.dart';

enum OrderStage { placed, processing, shipped, delivered }

class ShopOrder {
  ShopOrder({
    required this.id,
    required this.items,
    required this.placedAt,
    required this.deliveryAddress,
    this.stage = OrderStage.placed,
  });

  final String id;
  final List<CartItem> items;
  final DateTime placedAt;
  final String deliveryAddress;
  OrderStage stage;

  double get total => items.fold(0, (sum, item) => sum + item.lineTotal);
}
