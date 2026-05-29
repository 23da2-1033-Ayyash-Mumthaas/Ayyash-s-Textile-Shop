import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:textile_mobile_app/app/firebase_providers.dart';
import 'package:textile_mobile_app/data/seed/firestore_seed_service.dart';
import 'package:textile_mobile_app/providers/settings_provider.dart';
import 'package:textile_mobile_app/widgets/global_app_bar.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = context.watch<SettingsProvider>();
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'App Settings',
        onGoHome: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              value: settings.isDarkMode,
              title: const Text('Dark Theme'),
              subtitle: const Text('Toggle between dark and light mode'),
              onChanged: (value) {
                settings.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
            if (kDebugMode) ...[
              const Divider(),
              ListTile(
                title: const Text('Seed Firestore (dev)'),
                subtitle: const Text(
                  'Creates categories, products, banners, settings, offers',
                ),
                trailing: const Icon(Icons.cloud_upload_outlined),
                onTap: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  try {
                    final seed = FirestoreSeedService(ref.read(firestoreProvider));
                    await seed.seedAll();
                    if (context.mounted) {
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Firestore seed completed')),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      messenger.showSnackBar(
                        SnackBar(content: Text('Seed failed: $e')),
                      );
                    }
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
