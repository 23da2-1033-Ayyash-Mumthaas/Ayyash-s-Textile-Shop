import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textile_mobile_app/providers/product_provider.dart';
import 'package:textile_mobile_app/views/product_details_page.dart';
import 'package:textile_mobile_app/widgets/global_app_bar.dart';
import 'package:textile_mobile_app/widgets/product_card.dart';

class ProductListingPage extends StatelessWidget {
  const ProductListingPage({super.key, this.initialCategory});

  final String? initialCategory;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, _) {
        if (initialCategory != null &&
            productProvider.selectedCategory != initialCategory) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            productProvider.clearSearch();
            productProvider.setCategory(initialCategory!);
          });
        }
        return Scaffold(
          appBar: GlobalAppBar(
            title: initialCategory == null
                ? 'Discover Fashion'
                : '$initialCategory Collection',
            onGoHome: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  onChanged: productProvider.setSearchQuery,
                  decoration: const InputDecoration(
                    hintText: 'Search products (e.g. tshirt or t shirt)',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 42,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: productProvider.categories.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final category = productProvider.categories[index];
                      final selected =
                          category == productProvider.selectedCategory;
                      return ChoiceChip(
                        label: Text(category),
                        selected: selected,
                        onSelected: (_) =>
                            productProvider.setCategory(category),
                        selectedColor: Colors.white,
                        labelStyle: TextStyle(
                          color: selected ? Colors.black : Colors.white,
                        ),
                        backgroundColor: const Color(0xFF1A1A1A),
                        side: const BorderSide(color: Color(0xFF3A3A3A)),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    itemCount: productProvider.filteredProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemBuilder: (context, index) {
                      final product = productProvider.filteredProducts[index];
                      return ProductCard(
                        product: product,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailsPage(product: product),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
