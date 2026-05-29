import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';
import 'package:textile_mobile_app/data/models/delivery_rules.dart';

part 'app_settings_model.freezed.dart';
part 'app_settings_model.g.dart';

@freezed
class AppSettingsModel with _$AppSettingsModel {
  const factory AppSettingsModel({
    @Default("Ayyash's Textile Shop") String appName,
    @Default('') String logoUrl,
    @Default('') String darkLogoUrl,
    @Default(0.0) double taxPercent,
    @Default('PKR') String currency,
    @Default(DeliveryRules()) DeliveryRules deliveryRules,
    @Default(false) bool flashSaleEnabled,
    @TimestampConverter() DateTime? updatedAt,
  }) = _AppSettingsModel;

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);
}
