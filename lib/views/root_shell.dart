import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textile_mobile_app/providers/auth_provider.dart';
import 'package:textile_mobile_app/providers/cart_provider.dart';
import 'package:textile_mobile_app/views/cart_page.dart';
import 'package:textile_mobile_app/views/categories_page.dart';
import 'package:textile_mobile_app/views/home_page.dart';
import 'package:textile_mobile_app/views/orders_page.dart';
import 'package:textile_mobile_app/views/profile_page.dart';
import 'package:textile_mobile_app/widgets/global_app_bar.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    if (authProvider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final pages = [
      const HomePage(),
      const CategoriesPage(),
      const CartPage(),
      const OrdersPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      appBar: GlobalAppBar(
        onGoHome: () => setState(() => _selectedIndex = 0),
        title: _selectedIndex == 0
            ? 'Ayyash\'s Textile Shop'
            : _selectedIndex == 1
            ? 'Categories'
            : _selectedIndex == 2
            ? 'Cart'
            : _selectedIndex == 3
            ? 'Track Orders'
            : 'Profile',
      ),
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF2D2D2D)),
          ),
          child: Consumer<CartProvider>(
            builder: (context, cartProvider, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home,
                    label: 'Home',
                    index: 0,
                  ),
                  _navItem(
                    icon: Icons.grid_view_outlined,
                    activeIcon: Icons.grid_view,
                    label: 'Categories',
                    index: 1,
                  ),
                  _navItem(
                    icon: Icons.shopping_bag_outlined,
                    activeIcon: Icons.shopping_bag,
                    label: cartProvider.totalItems > 0
                        ? 'Cart (${cartProvider.totalItems})'
                        : 'Cart',
                    index: 2,
                  ),
                  _navItem(
                    icon: Icons.local_shipping_outlined,
                    activeIcon: Icons.local_shipping,
                    label: 'Orders',
                    index: 3,
                  ),
                  _navItem(
                    icon: Icons.person_outline,
                    activeIcon: Icons.person,
                    label: 'Profile',
                    index: 4,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isActive = _selectedIndex == index;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0x26FFFFFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? Colors.white : Colors.grey,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isActive ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
