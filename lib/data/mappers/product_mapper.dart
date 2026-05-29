import 'package:textile_mobile_app/data/models/product_model.dart';
import 'package:textile_mobile_app/data/models/review_model.dart';
import 'package:textile_mobile_app/models/product.dart';

class ProductMapper {
  const ProductMapper();

  Product toLegacy(
    ProductModel model, {
    List<String> reviewComments = const [],
  }) {
    return Product(
      id: model.id,
      name: model.name,
      category: model.categoryName.isNotEmpty ? model.categoryName : 'All',
      price: model.price,
      description: model.description,
      imageUrl: model.primaryImageUrl,
      isTrending: model.isTrending,
      isFeatured: model.isFeatured,
      reviews: reviewComments,
    );
  }

  List<String> reviewComments(List<ReviewModel> reviews) =>
      reviews.where((r) => r.isVisible).map((r) => r.comment).toList();
}
