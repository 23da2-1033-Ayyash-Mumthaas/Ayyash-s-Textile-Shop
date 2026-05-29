import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:textile_mobile_app/app/firebase_providers.dart';
import 'package:textile_mobile_app/providers/auth_provider.dart';
import 'package:textile_mobile_app/providers/cart_provider.dart';
import 'package:textile_mobile_app/providers/order_provider.dart';
import 'package:textile_mobile_app/providers/product_provider.dart';
import 'package:textile_mobile_app/providers/settings_provider.dart';

/// Bridges legacy ChangeNotifier providers to Riverpod.
final legacyAuthProvider = ChangeNotifierProvider<AuthProvider>(
  (ref) => AuthProvider()..loadSession(),
);

final legacyProductProvider = ChangeNotifierProvider<ProductProvider>((ref) {
  final provider = ProductProvider();
  ref.listen(productsStreamProvider, (previous, next) {
    next.whenData(provider.setFromFirestore);
  });
  return provider;
});

final legacyCartProvider = ChangeNotifierProvider<CartProvider>(
  (ref) => CartProvider(),
);

final legacyOrderProvider = ChangeNotifierProvider<OrderProvider>(
  (ref) => OrderProvider(),
);

final legacySettingsProvider = ChangeNotifierProvider<SettingsProvider>(
  (ref) => SettingsProvider()..loadTheme(),
);
