import 'package:flutter/material.dart';
import 'package:textile_mobile_app/views/customer_support_page.dart';
import 'package:textile_mobile_app/views/settings_page.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({super.key, required this.onGoHome, this.title});

  final VoidCallback onGoHome;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 56,
      leading: IconButton(
        onPressed: onGoHome,
        icon: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/logo.png',
            width: 30,
            height: 30,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.storefront),
          ),
        ),
      ),
      title: Text(title ?? 'Ayyash\'s Textile Shop'),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (value) {
            if (value == 'settings') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CustomerSupportPage()),
            );
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'settings', child: Text('App Settings')),
            PopupMenuItem(value: 'support', child: Text('Customer Support')),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
