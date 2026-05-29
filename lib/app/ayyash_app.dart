import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as legacy;
import 'package:responsive_framework/responsive_framework.dart';
import 'package:textile_mobile_app/app/app_theme.dart';
import 'package:textile_mobile_app/app/legacy_providers.dart';
import 'package:textile_mobile_app/app/router.dart';

class AyyashApp extends ConsumerWidget {
  const AyyashApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(legacySettingsProvider);
    final router = ref.watch(appRouterProvider);

    final auth = ref.watch(legacyAuthProvider);
    final product = ref.watch(legacyProductProvider);
    final cart = ref.watch(legacyCartProvider);
    final order = ref.watch(legacyOrderProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Ayyash's Textile Shop",
      themeMode: settings.themeMode,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerConfig: router,
      builder: (context, child) {
        return legacy.MultiProvider(
          providers: [
            legacy.ChangeNotifierProvider.value(value: auth),
            legacy.ChangeNotifierProvider.value(value: product),
            legacy.ChangeNotifierProvider.value(value: cart),
            legacy.ChangeNotifierProvider.value(value: order),
            legacy.ChangeNotifierProvider.value(value: settings),
          ],
          child: ResponsiveBreakpoints.builder(
            child: child ?? const SizedBox.shrink(),
            breakpoints: const [
              Breakpoint(start: 0, end: 450, name: MOBILE),
              Breakpoint(start: 451, end: 800, name: TABLET),
              Breakpoint(start: 801, end: 1920, name: DESKTOP),
              Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      },
    );
  }
}
