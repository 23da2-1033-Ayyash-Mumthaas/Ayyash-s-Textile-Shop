// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsModelImpl _$$AppSettingsModelImplFromJson(
  Map<String, dynamic> json,
) => _$AppSettingsModelImpl(
  appName: json['appName'] as String? ?? "Ayyash's Textile Shop",
  logoUrl: json['logoUrl'] as String? ?? '',
  darkLogoUrl: json['darkLogoUrl'] as String? ?? '',
  taxPercent: (json['taxPercent'] as num?)?.toDouble() ?? 0.0,
  currency: json['currency'] as String? ?? 'PKR',
  deliveryRules: json['deliveryRules'] == null
      ? const DeliveryRules()
      : DeliveryRules.fromJson(json['deliveryRules'] as Map<String, dynamic>),
  flashSaleEnabled: json['flashSaleEnabled'] as bool? ?? false,
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
);

Map<String, dynamic> _$$AppSettingsModelImplToJson(
  _$AppSettingsModelImpl instance,
) => <String, dynamic>{
  'appName': instance.appName,
  'logoUrl': instance.logoUrl,
  'darkLogoUrl': instance.darkLogoUrl,
  'taxPercent': instance.taxPercent,
  'currency': instance.currency,
  'deliveryRules': instance.deliveryRules,
  'flashSaleEnabled': instance.flashSaleEnabled,
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
};
