import 'package:flutter/material.dart';
import 'package:textile_mobile_app/services/session_service.dart';

class SettingsProvider extends ChangeNotifier {
  final SessionService _sessionService = SessionService();
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  Future<void> loadTheme() async {
    final mode = await _sessionService.loadThemeMode();
    _themeMode = mode == 'light' ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _sessionService.saveThemeMode(
      mode == ThemeMode.light ? 'light' : 'dark',
    );
    notifyListeners();
  }
}
