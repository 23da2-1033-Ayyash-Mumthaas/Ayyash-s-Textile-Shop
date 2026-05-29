import 'package:json_annotation/json_annotation.dart';
import 'package:textile_mobile_app/data/models/banner_model.dart';
import 'package:textile_mobile_app/data/models/offer_model.dart';
import 'package:textile_mobile_app/data/models/order_model.dart';

class BannerLinkTypeConverter implements JsonConverter<BannerLinkType, Object?> {
  const BannerLinkTypeConverter();

  @override
  BannerLinkType fromJson(Object? json) {
    final value = json?.toString() ?? 'none';
    return BannerLinkType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => BannerLinkType.none,
    );
  }

  @override
  String toJson(BannerLinkType object) => object.name;
}

class OfferTypeConverter implements JsonConverter<OfferType, Object?> {
  const OfferTypeConverter();

  @override
  OfferType fromJson(Object? json) {
    final value = json?.toString() ?? 'percentage';
    return OfferType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => OfferType.percentage,
    );
  }

  @override
  String toJson(OfferType object) => object.name;
}

class OrderStatusConverter implements JsonConverter<OrderStatus, Object?> {
  const OrderStatusConverter();

  @override
  OrderStatus fromJson(Object? json) {
    final value = json?.toString() ?? 'placed';
    return OrderStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => OrderStatus.placed,
    );
  }

  @override
  String toJson(OrderStatus object) => object.name;
}
