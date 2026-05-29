import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textile_mobile_app/models/product.dart';
import 'package:textile_mobile_app/providers/cart_provider.dart';
import 'package:textile_mobile_app/providers/product_provider.dart';
import 'package:textile_mobile_app/widgets/global_app_bar.dart';
import 'package:textile_mobile_app/widgets/product_card.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final similarProducts = context.watch<ProductProvider>().similarProducts(
      widget.product,
    );
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Product Details',
        onGoHome: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Hero(
            tag: widget.product.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image.network(
                  widget.product.imageUrl,
                  height: 310,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            '\$${widget.product.price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            widget.product.description,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 14),
          if (widget.product.availableSizes.isNotEmpty) ...[
            const Text(
              'Select Size',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: widget.product.availableSizes.map((size) {
                final isSelected = size == selectedSize;
                return ChoiceChip(
                  label: Text(size),
                  selected: isSelected,
                  onSelected: (_) => setState(() => selectedSize = size),
                );
              }).toList(),
            ),
            const SizedBox(height: 14),
          ],
          Row(
            children: [
              const Text(
                'Quantity',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: quantity > 1
                    ? () => setState(() => quantity--)
                    : null,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text('$quantity', style: const TextStyle(fontSize: 18)),
              IconButton(
                onPressed: () => setState(() => quantity++),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (widget.product.availableSizes.isNotEmpty &&
                    selectedSize == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a size')),
                  );
                  return;
                }
                context.read<CartProvider>().addToCart(
                  widget.product,
                  quantity: quantity,
                  size: selectedSize ?? '',
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Added to cart')));
              },
              child: const Text('Add to Cart'),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Reviews',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          ...widget.product.reviews.map(
            (review) => Card(
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: Text(review),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Similar Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarProducts.length,
              itemBuilder: (context, index) {
                final product = similarProducts[index];
                return SizedBox(
                  width: 170,
                  child: ProductCard(
                    product: product,
                    onTap: () => Navigator.pushReplacement(
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
}
