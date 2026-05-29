import 'package:textile_mobile_app/data/datasources/firestore_order_datasource.dart';
import 'package:textile_mobile_app/data/models/order_model.dart';

class OrderRepository {
  OrderRepository(this._dataSource);

  final FirestoreOrderDataSource _dataSource;

  Stream<List<OrderModel>> watchUserOrders(String userId) =>
      _dataSource.watchUserOrders(userId);

  Stream<List<OrderModel>> watchAllOrders() => _dataSource.watchAllOrders();

  Future<String> createOrder(OrderModel order) =>
      _dataSource.createOrder(order);

  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
    String note = '',
  }) => _dataSource.updateOrderStatus(
    orderId: orderId,
    status: status,
    note: note,
  );
}
