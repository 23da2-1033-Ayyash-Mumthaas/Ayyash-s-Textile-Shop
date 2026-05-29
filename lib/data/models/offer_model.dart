import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';
import 'package:textile_mobile_app/data/models/json_converters.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

enum OfferType { percentage, fixed, category, product }

@freezed
class OfferModel with _$OfferModel {
  const factory OfferModel({
    required String id,
    @Default('') String title,
    @OfferTypeConverter() @Default(OfferType.percentage) OfferType type,
    @Default(0.0) double value,
    @Default('') String couponCode,
    @Default('') String categoryId,
    @Default('') String productId,
    @Default(0.0) double minOrderAmount,
    @Default(0.0) double maxDiscount,
    @Default(true) bool isActive,
    @TimestampConverter() DateTime? startsAt,
    @TimestampConverter() DateTime? endsAt,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}
