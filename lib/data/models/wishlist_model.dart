import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';

part 'wishlist_model.freezed.dart';
part 'wishlist_model.g.dart';

@freezed
class WishlistModel with _$WishlistModel {
  const factory WishlistModel({
    required String id,
    @Default([]) List<String> productIds,
    @TimestampConverter() DateTime? updatedAt,
  }) = _WishlistModel;

  factory WishlistModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistModelFromJson(json);
}
