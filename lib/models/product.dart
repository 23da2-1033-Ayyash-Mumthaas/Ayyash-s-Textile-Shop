class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.isTrending = false,
    this.isFeatured = false,
    this.reviews = const [],
  });

  final String id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String imageUrl;
  final bool isTrending;
  final bool isFeatured;
  final List<String> reviews;

  List<String> get availableSizes {
    if (category == 'Accessories') return const [];
    if (category == 'Footwear') {
      return const ['5', '6', '7', '8', '9', '10', '11', '12'];
    }
    return const ['S', 'M', 'L', 'XL', 'XXL'];
  }
}
