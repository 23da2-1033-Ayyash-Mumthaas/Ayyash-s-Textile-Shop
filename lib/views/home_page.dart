import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textile_mobile_app/providers/product_provider.dart';
import 'package:textile_mobile_app/services/dummy_data.dart';
import 'package:textile_mobile_app/views/product_details_page.dart';
import 'package:textile_mobile_app/views/product_listing_page.dart';
import 'package:textile_mobile_app/widgets/hero_carousel.dart';
import 'package:textile_mobile_app/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 14),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Ayyash\'s Textile Shop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          HeroCarousel(
            onShopNow: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProductListingPage()),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: DummyData.categoryIcons.entries.map((entry) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductListingPage(initialCategory: entry.key),
                    ),
                  ),
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161616),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFF303030)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(entry.value, color: Colors.white),
                        const SizedBox(height: 6),
                        Text(entry.key, style: const TextStyle(fontSize: 11)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 18),
          _sectionHeader(context, 'Featured Products'),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productProvider.featuredProducts.length,
              itemBuilder: (context, index) {
                final product = productProvider.featuredProducts[index];
                return SizedBox(
                  width: 180,
                  child: ProductCard(
                    product: product,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsPage(product: product),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          _sectionHeader(context, 'Trending'),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productProvider.trendingProducts.length,
              itemBuilder: (context, index) {
                final product = productProvider.trendingProducts[index];
                return SizedBox(
                  width: 180,
                  child: ProductCard(
                    product: product,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsPage(product: product),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProductListingPage()),
            ),
            child: const Text('View all'),
          ),
        ],
      ),
    );
  }
}
