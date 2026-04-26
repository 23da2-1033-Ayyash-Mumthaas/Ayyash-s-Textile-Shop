import 'package:flutter/material.dart';
import 'package:textile_mobile_app/models/product.dart';

class DummyData {
  static const heroBanners = [
    'https://images.unsplash.com/photo-1445205170230-053b83016050?w=1200',
    'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=1200',
    'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?w=1200',
  ];

  static const categoryIcons = <String, IconData>{
    'Men': Icons.man_outlined,
    'Women': Icons.woman_2_outlined,
    'Kids': Icons.child_care_outlined,
    'Footwear': Icons.hiking_outlined,
    'Accessories': Icons.watch_outlined,
    'Ethnic': Icons.auto_awesome_outlined,
  };

  static const products = [
    Product(
      id: 'p1',
      name: 'Classic T Shirt',
      category: 'Men',
      price: 34.99,
      description: 'Soft premium cotton T shirt with clean tailoring.',
      imageUrl:
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800',
      isFeatured: true,
      isTrending: true,
      reviews: [
        'Great fit and premium fabric.',
        'Color stayed solid after wash.',
      ],
    ),
    Product(
      id: 'p2',
      name: 'Urban Denim Jacket',
      category: 'Women',
      price: 89.99,
      description: 'Lightweight denim jacket designed for all-season styling.',
      imageUrl:
          'https://images.unsplash.com/photo-1543076447-215ad9ba6923?w=800',
      isFeatured: true,
      reviews: ['Stylish and comfortable.', 'Looks exactly like images.'],
    ),
    Product(
      id: 'p3',
      name: 'Minimal Sneakers',
      category: 'Footwear',
      price: 69.99,
      description: 'Monochrome sneakers with cushioned comfort.',
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      isTrending: true,
      reviews: ['Very comfortable sole.', 'Perfect daily wear shoe.'],
    ),
    Product(
      id: 'p4',
      name: 'Festive Kurta Set',
      category: 'Ethnic',
      price: 74.5,
      description: 'Elegant ethnic kurta set for festive gatherings.',
      imageUrl:
          'https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=800',
      isFeatured: true,
      reviews: ['Beautiful festive look.', 'Material quality is good.'],
    ),
    Product(
      id: 'p5',
      name: 'Statement Handbag',
      category: 'Accessories',
      price: 52.0,
      description: 'Structured handbag with polished hardware detailing.',
      imageUrl:
          'https://images.unsplash.com/photo-1591561954557-26941169b49e?w=800',
      isTrending: true,
      reviews: ['Spacious and elegant.', 'Matches many outfits.'],
    ),
    Product(
      id: 'p6',
      name: 'Kids Printed Hoodie',
      category: 'Kids',
      price: 39.99,
      description: 'Warm printed hoodie with playful color blocking.',
      imageUrl:
          'https://images.unsplash.com/photo-1519238361156-2bd96f6f6e6c?w=800',
      reviews: ['Warm and cozy for kids.', 'Soft inner lining.'],
    ),
    Product(
      id: 'p7',
      name: 'Tailored Black Blazer',
      category: 'Women',
      price: 99.99,
      description: 'Sharp silhouette blazer for premium evening style.',
      imageUrl:
          'https://images.unsplash.com/photo-1581044777550-4cfa60707c03?w=800',
      isTrending: true,
      reviews: ['Excellent tailoring.', 'Gives a sharp formal look.'],
    ),
    Product(
      id: 'p8',
      name: 'Relaxed Linen Shirt',
      category: 'Men',
      price: 45.25,
      description: 'Breathable linen shirt in a relaxed modern fit.',
      imageUrl:
          'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=800',
      reviews: ['Lightweight and breathable.', 'Great summer shirt.'],
    ),
  ];
}
