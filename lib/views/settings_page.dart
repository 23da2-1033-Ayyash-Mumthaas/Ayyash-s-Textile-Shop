import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textile_mobile_app/providers/settings_provider.dart';
import 'package:textile_mobile_app/widgets/global_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
