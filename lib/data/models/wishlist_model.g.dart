// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WishlistModelImpl _$$WishlistModelImplFromJson(Map<String, dynamic> json) =>
    _$WishlistModelImpl(
      id: json['id'] as String,
      productIds:
          (json['productIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$WishlistModelImplToJson(_$WishlistModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productIds': instance.productIds,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
