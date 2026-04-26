import 'package:shared_preferences/shared_preferences.dart';
import 'package:textile_mobile_app/models/app_user.dart';

class SessionService {
  static const _keyLoggedIn = 'logged_in';
  static const _keyFirstName = 'user_first_name';
  static const _keyLastName = 'user_last_name';
  static const _keyEmail = 'user_email';
  static const _keyCity = 'user_city';
  static const _keyPhone = 'user_phone';
  static const _keyAddress = 'user_address';
  static const _keyThemeMode = 'theme_mode';

  Future<void> saveUserSession(AppUser user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, true);
    await prefs.setString(_keyFirstName, user.firstName);
    await prefs.setString(_keyLastName, user.lastName);
    await prefs.setString(_keyEmail, user.email);
    await prefs.setString(_keyCity, user.city);
    await prefs.setString(_keyPhone, user.phone);
    await prefs.setString(_keyAddress, user.address);
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLoggedIn);
    await prefs.remove(_keyFirstName);
    await prefs.remove(_keyLastName);
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyCity);
    await prefs.remove(_keyPhone);
    await prefs.remove(_keyAddress);
  }

  Future<(bool, AppUser?)> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(_keyLoggedIn) ?? false;
    if (!isLoggedIn) {
      return (false, null);
    }
    final user = AppUser(
      firstName: prefs.getString(_keyFirstName) ?? 'User',
      lastName: prefs.getString(_keyLastName) ?? '',
      email: prefs.getString(_keyEmail) ?? '',
      city: prefs.getString(_keyCity) ?? '',
      phone: prefs.getString(_keyPhone) ?? '',
      address: prefs.getString(_keyAddress) ?? '',
    );
    return (true, user);
  }

  Future<void> saveThemeMode(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, mode);
  }

  Future<String> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyThemeMode) ?? 'dark';
  }
}
