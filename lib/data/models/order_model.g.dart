// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderLineItemImpl _$$OrderLineItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderLineItemImpl(
      productId: json['productId'] as String,
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      size: json['size'] as String? ?? '',
      color: json['color'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      lineTotal: (json['lineTotal'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$OrderLineItemImplToJson(_$OrderLineItemImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'size': instance.size,
      'color': instance.color,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'lineTotal': instance.lineTotal,
    };

_$OrderTimelineEntryImpl _$$OrderTimelineEntryImplFromJson(
  Map<String, dynamic> json,
) => _$OrderTimelineEntryImpl(
  status: json['status'] == null
      ? OrderStatus.placed
      : const OrderStatusConverter().fromJson(json['status']),
  at: const TimestampConverter().fromJson(json['at']),
  note: json['note'] as String? ?? '',
);

Map<String, dynamic> _$$OrderTimelineEntryImplToJson(
  _$OrderTimelineEntryImpl instance,
) => <String, dynamic>{
  'status': const OrderStatusConverter().toJson(instance.status),
  'at': const TimestampConverter().toJson(instance.at),
  'note': instance.note,
};

_$DeliveryAddressSnapshotImpl _$$DeliveryAddressSnapshotImplFromJson(
  Map<String, dynamic> json,
) => _$DeliveryAddressSnapshotImpl(
  line1: json['line1'] as String? ?? '',
  city: json['city'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
);

Map<String, dynamic> _$$DeliveryAddressSnapshotImplToJson(
  _$DeliveryAddressSnapshotImpl instance,
) => <String, dynamic>{
  'line1': instance.line1,
  'city': instance.city,
  'phone': instance.phone,
};

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => OrderLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: json['status'] == null
          ? OrderStatus.placed
          : const OrderStatusConverter().fromJson(json['status']),
      paymentMethod: json['paymentMethod'] as String? ?? 'cod',
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      couponCode: json['couponCode'] as String? ?? '',
      deliveryAddress: json['deliveryAddress'] == null
          ? const DeliveryAddressSnapshot()
          : DeliveryAddressSnapshot.fromJson(
              json['deliveryAddress'] as Map<String, dynamic>,
            ),
      timeline:
          (json['timeline'] as List<dynamic>?)
              ?.map(
                (e) => OrderTimelineEntry.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      placedAt: const TimestampConverter().fromJson(json['placedAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'items': instance.items,
      'status': const OrderStatusConverter().toJson(instance.status),
      'paymentMethod': instance.paymentMethod,
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'tax': instance.tax,
      'deliveryFee': instance.deliveryFee,
      'total': instance.total,
      'couponCode': instance.couponCode,
      'deliveryAddress': instance.deliveryAddress,
      'timeline': instance.timeline,
      'placedAt': const TimestampConverter().toJson(instance.placedAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
