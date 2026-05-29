// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      type: json['type'] == null
          ? OfferType.percentage
          : const OfferTypeConverter().fromJson(json['type']),
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
      couponCode: json['couponCode'] as String? ?? '',
      categoryId: json['categoryId'] as String? ?? '',
      productId: json['productId'] as String? ?? '',
      minOrderAmount: (json['minOrderAmount'] as num?)?.toDouble() ?? 0.0,
      maxDiscount: (json['maxDiscount'] as num?)?.toDouble() ?? 0.0,
      isActive: json['isActive'] as bool? ?? true,
      startsAt: const TimestampConverter().fromJson(json['startsAt']),
      endsAt: const TimestampConverter().fromJson(json['endsAt']),
    );

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': const OfferTypeConverter().toJson(instance.type),
      'value': instance.value,
      'couponCode': instance.couponCode,
      'categoryId': instance.categoryId,
      'productId': instance.productId,
      'minOrderAmount': instance.minOrderAmount,
      'maxDiscount': instance.maxDiscount,
      'isActive': instance.isActive,
      'startsAt': const TimestampConverter().toJson(instance.startsAt),
      'endsAt': const TimestampConverter().toJson(instance.endsAt),
    };
