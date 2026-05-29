import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:textile_mobile_app/core/constants/firestore_paths.dart';

class FirestoreSeedService {
  FirestoreSeedService(this._db);

  final FirebaseFirestore _db;

  Future<void> seedAll({String? adminUid, String? adminEmail}) async {
    final batch = _db.batch();
    final now = FieldValue.serverTimestamp();

    final settingsRef = _db
        .collection(FirestorePaths.settings)
        .doc(FirestorePaths.settingsAppDoc);
    batch.set(settingsRef, {
      'appName': "Ayyash's Textile Shop",
      'logoUrl': '',
      'darkLogoUrl': '',
      'taxPercent': 0,
      'currency': 'PKR',
      'deliveryRules': {
        'baseWeightKg': 1,
        'baseFee': 450,
        'extraPerKg': 150,
        'currency': 'PKR',
      },
      'flashSaleEnabled': true,
      'updatedAt': now,
    }, SetOptions(merge: true));

    final categoryDefs = [
      ('cat_men', 'Men', 'man_outlined', 1),
      ('cat_women', 'Women', 'woman_2_outlined', 2),
      ('cat_kids', 'Kids', 'child_care_outlined', 3),
      ('cat_footwear', 'Footwear', 'hiking_outlined', 4),
      ('cat_accessories', 'Accessories', 'watch_outlined', 5),
      ('cat_ethnic', 'Ethnic', 'auto_awesome_outlined', 6),
    ];
    for (final (id, name, icon, order) in categoryDefs) {
      batch.set(_db.collection(FirestorePaths.categories).doc(id), {
        'name': name,
        'slug': name.toLowerCase(),
        'imageUrl': '',
        'iconName': icon,
        'sortOrder': order,
        'isActive': true,
        'createdAt': now,
        'updatedAt': now,
      });
    }

    const heroBanners = [
      'https://images.unsplash.com/photo-1445205170230-053b83016050?w=1200',
      'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=1200',
      'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?w=1200',
    ];
    for (var i = 0; i < heroBanners.length; i++) {
      batch.set(_db.collection(FirestorePaths.banners).doc('banner_$i'), {
        'title': i == 0 ? 'New Season' : 'Premium Textiles',
        'subtitle': 'Shop the collection',
        'imageUrl': heroBanners[i],
        'linkType': 'none',
        'linkValue': '',
        'sortOrder': i,
        'isActive': true,
        'createdAt': now,
      });
    }

    batch.set(_db.collection(FirestorePaths.offers).doc('offer_welcome10'), {
      'title': 'Welcome 10% Off',
      'type': 'percentage',
      'value': 10,
      'couponCode': 'WELCOME10',
      'categoryId': '',
      'productId': '',
      'minOrderAmount': 2000,
      'maxDiscount': 1500,
      'isActive': true,
      'startsAt': now,
      'endsAt': null,
    });

    await batch.commit();

    final products = [
      (
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
      (
        id: 'p2',
        name: 'Urban Denim Jacket',
        category: 'Women',
        price: 89.99,
        description:
            'Lightweight denim jacket designed for all-season styling.',
        imageUrl:
            'https://images.unsplash.com/photo-1543076447-215ad9ba6923?w=800',
        isFeatured: true,
        isTrending: false,
        reviews: ['Stylish and comfortable.', 'Looks exactly like images.'],
      ),
      (
        id: 'p3',
        name: 'Minimal Sneakers',
        category: 'Footwear',
        price: 69.99,
        description: 'Monochrome sneakers with cushioned comfort.',
        imageUrl:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
        isFeatured: false,
        isTrending: true,
        reviews: ['Very comfortable sole.', 'Perfect daily wear shoe.'],
      ),
      (
        id: 'p4',
        name: 'Festive Kurta Set',
        category: 'Ethnic',
        price: 74.5,
        description: 'Elegant ethnic kurta set for festive gatherings.',
        imageUrl:
            'https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=800',
        isFeatured: true,
        isTrending: false,
        reviews: ['Beautiful festive look.', 'Material quality is good.'],
      ),
      (
        id: 'p5',
        name: 'Statement Handbag',
        category: 'Accessories',
        price: 52.0,
        description: 'Structured handbag with polished hardware detailing.',
        imageUrl:
            'https://images.unsplash.com/photo-1591561954557-26941169b49e?w=800',
        isFeatured: false,
        isTrending: true,
        reviews: ['Spacious and elegant.', 'Matches many outfits.'],
      ),
      (
        id: 'p6',
        name: 'Kids Printed Hoodie',
        category: 'Kids',
        price: 39.99,
        description: 'Warm printed hoodie with playful color blocking.',
        imageUrl:
            'https://images.unsplash.com/photo-1519238361156-2bd96f6f6e6c?w=800',
        isFeatured: false,
        isTrending: false,
        reviews: ['Warm and cozy for kids.', 'Soft inner lining.'],
      ),
      (
        id: 'p7',
        name: 'Tailored Black Blazer',
        category: 'Women',
        price: 99.99,
        description: 'Sharp silhouette blazer for premium evening style.',
        imageUrl:
            'https://images.unsplash.com/photo-1581044777550-4cfa60707c03?w=800',
        isFeatured: false,
        isTrending: true,
        reviews: ['Excellent tailoring.', 'Gives a sharp formal look.'],
      ),
      (
        id: 'p8',
        name: 'Relaxed Linen Shirt',
        category: 'Men',
        price: 45.25,
        description: 'Breathable linen shirt in a relaxed modern fit.',
        imageUrl:
            'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=800',
        isFeatured: false,
        isTrending: false,
        reviews: ['Lightweight and breathable.', 'Great summer shirt.'],
      ),
    ];

    final productBatch = _db.batch();
    for (final p in products) {
      final catSlug = p.category.toLowerCase();
      final categoryId = 'cat_$catSlug';
      final sizes = p.category == 'Accessories'
          ? <String>[]
          : p.category == 'Footwear'
          ? ['5', '6', '7', '8', '9', '10', '11', '12']
          : ['S', 'M', 'L', 'XL', 'XXL'];
      final variants = sizes
          .map(
            (s) => {
              'id': '${p.id}_$s',
              'sku': '${p.id}-$s',
              'size': s,
              'color': '',
              'stock': 25,
              'priceDelta': 0,
            },
          )
          .toList();

      productBatch.set(_db.collection(FirestorePaths.products).doc(p.id), {
        'name': p.name,
        'slug': p.name.toLowerCase().replaceAll(' ', '-'),
        'description': p.description,
        'categoryId': categoryId,
        'categoryName': p.category,
        'price': p.price,
        'compareAtPrice': null,
        'currency': 'PKR',
        'imageUrls': [p.imageUrl],
        'variants': variants,
        'tags': [p.category.toLowerCase()],
        'weightKg': p.category == 'Footwear' ? 0.8 : 0.4,
        'isFeatured': p.isFeatured,
        'isTrending': p.isTrending,
        'isActive': true,
        'ratingAvg': 4.5,
        'ratingCount': p.reviews.length,
        'stockTotal': variants.isEmpty ? 50 : variants.length * 25,
        'createdAt': now,
        'updatedAt': now,
      });

      for (var i = 0; i < p.reviews.length; i++) {
        productBatch.set(
          _db.collection(FirestorePaths.reviews).doc('${p.id}_review_$i'),
          {
            'productId': p.id,
            'userId': 'seed',
            'userName': 'Customer',
            'rating': 5,
            'comment': p.reviews[i],
            'isVisible': true,
            'createdAt': now,
          },
        );
      }
    }
    await productBatch.commit();

    if (adminUid != null && adminEmail != null) {
      await _db.collection(FirestorePaths.admins).doc(adminUid).set({
        'email': adminEmail,
        'displayName': 'Store Admin',
        'roles': ['super_admin'],
        'isActive': true,
        'createdAt': now,
      }, SetOptions(merge: true));
    }

    if (kDebugMode) debugPrint('[FirestoreSeedService] Seed completed.');
  }
}
