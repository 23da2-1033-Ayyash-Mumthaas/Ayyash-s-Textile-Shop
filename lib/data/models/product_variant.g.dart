// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductVariantImpl _$$ProductVariantImplFromJson(Map<String, dynamic> json) =>
    _$ProductVariantImpl(
      id: json['id'] as String,
      sku: json['sku'] as String? ?? '',
      size: json['size'] as String? ?? '',
      color: json['color'] as String? ?? '',
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      priceDelta: (json['priceDelta'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ProductVariantImplToJson(
  _$ProductVariantImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'size': instance.size,
  'color': instance.color,
  'stock': instance.stock,
  'priceDelta': instance.priceDelta,
};
