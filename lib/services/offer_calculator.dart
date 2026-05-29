import 'package:textile_mobile_app/data/models/offer_model.dart';

class OfferCalculationResult {
  const OfferCalculationResult({
    required this.discount,
    this.appliedOffer,
    this.message = '',
  });

  final double discount;
  final OfferModel? appliedOffer;
  final String message;
}

class OfferCalculator {
  const OfferCalculator();

  OfferCalculationResult calculate({
    required double subtotal,
    required List<OfferModel> offers,
    String? couponCode,
    String? categoryId,
    String? productId,
  }) {
    final now = DateTime.now();
    final active = offers.where((o) {
      if (!o.isActive) return false;
      if (o.startsAt != null && now.isBefore(o.startsAt!)) return false;
      if (o.endsAt != null && now.isAfter(o.endsAt!)) return false;
      if (subtotal < o.minOrderAmount) return false;
      return true;
    }).toList();

    OfferModel? match;
    if (couponCode != null && couponCode.trim().isNotEmpty) {
      final code = couponCode.trim().toLowerCase();
      for (final o in active) {
        if (o.couponCode.isNotEmpty && o.couponCode.toLowerCase() == code) {
          match = o;
          break;
        }
      }
    }

    match ??= () {
      for (final o in active) {
        switch (o.type) {
          case OfferType.product:
            if (productId != null && o.productId == productId) return o;
          case OfferType.category:
            if (categoryId != null && o.categoryId == categoryId) return o;
          case OfferType.percentage:
          case OfferType.fixed:
            if (o.couponCode.isEmpty) return o;
        }
      }
      return null;
    }();

    if (match == null) {
      return const OfferCalculationResult(
        discount: 0,
        message: 'No offer applied',
      );
    }

    double discount = 0;
    switch (match.type) {
      case OfferType.percentage:
        discount = subtotal * (match.value / 100);
        break;
      case OfferType.fixed:
        discount = match.value;
        break;
      case OfferType.category:
      case OfferType.product:
        discount = subtotal * (match.value / 100);
        break;
    }

    if (match.maxDiscount > 0 && discount > match.maxDiscount) {
      discount = match.maxDiscount;
    }
    if (discount > subtotal) discount = subtotal;

    return OfferCalculationResult(
      discount: discount,
      appliedOffer: match,
      message: 'Applied: ${match.title}',
    );
  }
}
