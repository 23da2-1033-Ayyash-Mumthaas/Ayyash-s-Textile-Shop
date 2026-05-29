import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:textile_mobile_app/core/constants/firestore_paths.dart';
import 'package:textile_mobile_app/models/app_user.dart';
import 'package:textile_mobile_app/services/session_service.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SessionService _sessionService = SessionService();

  bool _isLoggedIn = false;
  bool _isLoading = true;
  bool _isAdmin = false;
  AppUser? _user;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  bool get isAdmin => _isAdmin;
  AppUser? get user => _user;

  Future<void> loadSession() async {
    _isLoading = true;
    notifyListeners();

    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      final session = await _sessionService.loadSession();
      if (session.$1 && session.$2 != null) {
        _user = session.$2;
        _isLoggedIn = true;
        await _checkAdmin(firebaseUser.uid);
      } else {
        _user = AppUser(
          firstName: firebaseUser.displayName ?? firebaseUser.email ?? '',
          lastName: '',
          email: firebaseUser.email ?? '',
          city: '',
          phone: firebaseUser.phoneNumber ?? '',
        );
        _isLoggedIn = true;
        await _sessionService.saveUserSession(_user!);
        await _checkAdmin(firebaseUser.uid);
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = credential.user!.uid;

      final userDoc = await _firestore
          .collection(FirestorePaths.users)
          .doc(uid)
          .get();
      if (userDoc.exists) {
        _user = AppUser(
          firstName: userDoc.data()?['firstName'] as String? ?? '',
          lastName: userDoc.data()?['lastName'] as String? ?? '',
          email: email,
          city: userDoc.data()?['city'] as String? ?? '',
          phone: userDoc.data()?['phone'] as String? ?? '',
          address: userDoc.data()?['address'] as String? ?? '',
        );
      } else {
        _user = AppUser(
          firstName: credential.user?.displayName ?? email.split('@').first,
          lastName: '',
          email: email,
          city: '',
          phone: '',
        );
      }

      _isLoggedIn = true;
      await _sessionService.saveUserSession(_user!);
      await _checkAdmin(uid);
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      return _mapFirebaseError(e);
    }
  }

  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Wrong password';
      case 'invalid-credential':
        return 'Invalid email or password';
      case 'invalid-email':
        return 'Invalid email format';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Try again later';
      case 'operation-not-allowed':
        return 'Email/Password sign-in is not enabled in Firebase Console';
      case 'network-request-failed':
        return 'Network error. Check your connection';
      case 'invalid-api-key':
        return 'Firebase API key is invalid or not configured for this platform';
      case 'app-not-authorized':
        return 'Firebase app is not authorized. Check Firebase Console settings';
      default:
        return 'Login failed: ${e.code} (${e.message ?? 'unknown error'})';
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String city,
    required String phone,
    required String password,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;

    await credential.user!.updateDisplayName('$firstName $lastName');

    _user = AppUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      city: city,
      phone: phone,
    );

    await _firestore.collection(FirestorePaths.users).doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'city': city,
      'phone': phone,
      'address': '',
      'createdAt': FieldValue.serverTimestamp(),
    });

    _isLoggedIn = true;
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
    final uid = _firebaseAuth.currentUser?.uid;
    if (uid == null) return;

    _user = _user!.copyWith(
      firstName: firstName,
      lastName: lastName,
      city: city,
      phone: phone,
      address: address,
    );

    await _firestore.collection(FirestorePaths.users).doc(uid).update({
      'firstName': firstName,
      'lastName': lastName,
      'city': city,
      'phone': phone,
      'address': address,
    });

    await _sessionService.saveUserSession(_user!);
    notifyListeners();
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    _isLoggedIn = false;
    _isAdmin = false;
    _user = null;
    await _sessionService.clearSession();
    notifyListeners();
  }

  Future<void> _checkAdmin(String uid) async {
    try {
      final doc = await _firestore
          .collection(FirestorePaths.admins)
          .doc(uid)
          .get();
      _isAdmin = doc.exists && (doc.data()?['isActive'] as bool? ?? false);
      notifyListeners();
    } catch (_) {
      _isAdmin = false;
    }
  }
}
