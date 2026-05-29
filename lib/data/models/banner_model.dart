import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';
import 'package:textile_mobile_app/data/models/json_converters.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

enum BannerLinkType { none, category, product, url }

@freezed
class BannerModel with _$BannerModel {
  const factory BannerModel({
    required String id,
    @Default('') String title,
    @Default('') String subtitle,
    required String imageUrl,
    @BannerLinkTypeConverter() @Default(BannerLinkType.none) BannerLinkType linkType,
    @Default('') String linkValue,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
    @TimestampConverter() DateTime? startsAt,
    @TimestampConverter() DateTime? endsAt,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
