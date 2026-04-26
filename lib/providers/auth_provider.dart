import 'package:flutter/foundation.dart';
import 'package:textile_mobile_app/models/app_user.dart';
import 'package:textile_mobile_app/services/session_service.dart';

class AuthProvider extends ChangeNotifier {
  final SessionService _sessionService = SessionService();

  bool _isLoggedIn = false;
  bool _isLoading = true;
  AppUser? _user;
  AppUser? _registeredUser;
  String? _registeredPassword;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  AppUser? get user => _user;

  Future<void> loadSession() async {
    _isLoading = true;
    notifyListeners();
    final session = await _sessionService.loadSession();
    _isLoggedIn = session.$1;
    _user = session.$2;
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> login({required String email, required String password}) async {
    if (_registeredUser == null || _registeredPassword == null) {
      return false;
    }
    if (_registeredUser!.email != email || _registeredPassword != password) {
      return false;
    }
    _isLoggedIn = true;
    _user = _registeredUser;
    await _sessionService.saveUserSession(_user!);
    notifyListeners();
    return true;
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String city,
    required String phone,
    required String password,
  }) async {
    _registeredUser = AppUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      city: city,
      phone: phone,
    );
    _registeredPassword = password;
    _isLoggedIn = true;
    _user = _registeredUser;
    await _sessionService.saveUserSession(_user!);
    notifyListeners();
  }

  Future<void> updateUserProfile({
    required String firstName,
    required String lastName,
    required String city,
    required String phone,
    required String address,
  }) async {
    if (_user == null) return;
    _user = _user!.copyWith(
      firstName: firstName,
      lastName: lastName,
      city: city,
      phone: phone,
      address: address,
    );
    _registeredUser = _user;
    await _sessionService.saveUserSession(_user!);
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _user = null;
    await _sessionService.clearSession();
    notifyListeners();
  }
}
