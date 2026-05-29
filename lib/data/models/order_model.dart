import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';
import 'package:textile_mobile_app/data/models/json_converters.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

enum OrderStatus { placed, processing, shipped, delivered, cancelled }

@freezed
class OrderLineItem with _$OrderLineItem {
  const OrderLineItem._();

  const factory OrderLineItem({
    required String productId,
    @Default('') String name,
    @Default('') String imageUrl,
    @Default('') String size,
    @Default('') String color,
    @Default(1) int quantity,
    @Default(0.0) double unitPrice,
    @Default(0.0) double lineTotal,
  }) = _OrderLineItem;

  factory OrderLineItem.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemFromJson(json);
}

@freezed
class OrderTimelineEntry with _$OrderTimelineEntry {
  const factory OrderTimelineEntry({
    @OrderStatusConverter() @Default(OrderStatus.placed) OrderStatus status,
    @TimestampConverter() DateTime? at,
    @Default('') String note,
  }) = _OrderTimelineEntry;

  factory OrderTimelineEntry.fromJson(Map<String, dynamic> json) =>
      _$OrderTimelineEntryFromJson(json);
}

@freezed
class DeliveryAddressSnapshot with _$DeliveryAddressSnapshot {
  const factory DeliveryAddressSnapshot({
    @Default('') String line1,
    @Default('') String city,
    @Default('') String phone,
  }) = _DeliveryAddressSnapshot;

  factory DeliveryAddressSnapshot.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressSnapshotFromJson(json);
}

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required String id,
    required String userId,
    @Default([]) List<OrderLineItem> items,
    @OrderStatusConverter() @Default(OrderStatus.placed) OrderStatus status,
    @Default('cod') String paymentMethod,
    @Default(0.0) double subtotal,
    @Default(0.0) double discount,
    @Default(0.0) double tax,
    @Default(0.0) double deliveryFee,
    @Default(0.0) double total,
    @Default('') String couponCode,
    @Default(DeliveryAddressSnapshot()) DeliveryAddressSnapshot deliveryAddress,
    @Default([]) List<OrderTimelineEntry> timeline,
    @TimestampConverter() DateTime? placedAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
