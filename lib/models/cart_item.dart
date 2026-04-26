import 'package:textile_mobile_app/models/product.dart';

class CartItem {
  CartItem({required this.product, this.quantity = 1, this.size = ''});

  final Product product;
  int quantity;
  final String size;

  double get lineTotal => product.price * quantity;
}
