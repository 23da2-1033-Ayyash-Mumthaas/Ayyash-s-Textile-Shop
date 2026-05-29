import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String id,
    required String productId,
    required String userId,
    @Default('') String userName,
    @Default(5) int rating,
    @Default('') String comment,
    @Default(true) bool isVisible,
    @TimestampConverter() DateTime? createdAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
