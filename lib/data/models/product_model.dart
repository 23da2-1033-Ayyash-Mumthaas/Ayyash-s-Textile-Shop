import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:textile_mobile_app/utils/timestamp_converter.dart';
import 'package:textile_mobile_app/data/models/product_variant.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String id,
    required String name,
    @Default('') String slug,
    @Default('') String description,
    @Default('') String categoryId,
    @Default('') String categoryName,
    @Default(0.0) double price,
    double? compareAtPrice,
    @Default('PKR') String currency,
    @Default([]) List<String> imageUrls,
    @Default([]) List<ProductVariant> variants,
    @Default([]) List<String> tags,
    @Default(0.5) double weightKg,
    @Default(false) bool isFeatured,
    @Default(false) bool isTrending,
    @Default(true) bool isActive,
    @Default(0.0) double ratingAvg,
    @Default(0) int ratingCount,
    @Default(0) int stockTotal,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  String get primaryImageUrl =>
      imageUrls.isNotEmpty ? imageUrls.first : '';

  List<String> get availableSizes => variants
      .map((v) => v.size)
      .where((s) => s.isNotEmpty)
      .toSet()
      .toList();
}
