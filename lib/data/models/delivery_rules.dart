import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_rules.freezed.dart';
part 'delivery_rules.g.dart';

@freezed
class DeliveryRules with _$DeliveryRules {
  const factory DeliveryRules({
    @Default(1.0) double baseWeightKg,
    @Default(450.0) double baseFee,
    @Default(150.0) double extraPerKg,
    @Default('PKR') String currency,
  }) = _DeliveryRules;

  factory DeliveryRules.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRulesFromJson(json);
}
