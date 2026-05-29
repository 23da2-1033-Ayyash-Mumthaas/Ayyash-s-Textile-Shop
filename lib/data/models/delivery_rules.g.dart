// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryRulesImpl _$$DeliveryRulesImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryRulesImpl(
      baseWeightKg: (json['baseWeightKg'] as num?)?.toDouble() ?? 1.0,
      baseFee: (json['baseFee'] as num?)?.toDouble() ?? 450.0,
      extraPerKg: (json['extraPerKg'] as num?)?.toDouble() ?? 150.0,
      currency: json['currency'] as String? ?? 'PKR',
    );

Map<String, dynamic> _$$DeliveryRulesImplToJson(_$DeliveryRulesImpl instance) =>
    <String, dynamic>{
      'baseWeightKg': instance.baseWeightKg,
      'baseFee': instance.baseFee,
      'extraPerKg': instance.extraPerKg,
      'currency': instance.currency,
    };
