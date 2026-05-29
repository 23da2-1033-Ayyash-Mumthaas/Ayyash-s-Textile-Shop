import 'package:textile_mobile_app/data/models/delivery_rules.dart';

class DeliveryFeeEngine {
  const DeliveryFeeEngine([this.rules = const DeliveryRules()]);

  final DeliveryRules rules;

  double calculate({required double totalWeightKg}) {
    if (totalWeightKg <= 0) return rules.baseFee;

    final base = rules.baseWeightKg <= 0 ? 1.0 : rules.baseWeightKg;
    if (totalWeightKg <= base) return rules.baseFee;

    final extraKg = (totalWeightKg - base).ceil();
    return rules.baseFee + (extraKg * rules.extraPerKg);
  }
}
