import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:textile_mobile_app/app/legacy_providers.dart';
import 'package:textile_mobile_app/screens/admin_panel_page.dart';
import 'package:textile_mobile_app/screens/login_page.dart';
import 'package:textile_mobile_app/screens/root_shell.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(legacyAuthProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => const RootShell(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/admin',
        name: 'admin',
        builder: (context, state) => const AdminPanelPage(),
      ),
    ],
    redirect: (context, state) {
      final isLoggingIn = state.matchedLocation == '/login';
      final loggedIn = auth.isLoggedIn;
      if (!loggedIn && isLoggingIn) return null;
      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(state.error?.toString() ?? 'Unknown navigation error'),
      ),
    ),
  );
});
