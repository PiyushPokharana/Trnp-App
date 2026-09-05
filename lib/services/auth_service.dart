import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  final String email;
  final String displayName;
  final String? photoUrl;
  final bool isDevMode;

  UserSession({
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.isDevMode = false,
  });
}

class AuthService extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  UserSession? _currentUser;
  bool _isLoading = false;

  UserSession? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;
  bool get isLoading => _isLoading;

  AuthService() {
    _restoreSession();
  }

  Future<void> _restoreSession() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final savedEmail = prefs.getString('user_email');
      final savedName = prefs.getString('user_name');
      final isDev = prefs.getBool('user_is_dev') ?? false;

      if (savedEmail != null && savedName != null) {
        _currentUser = UserSession(
          email: savedEmail,
          displayName: savedName,
          photoUrl: prefs.getString('user_photo'),
          isDevMode: isDev,
        );
      }
    } catch (e) {
      debugPrint('Error restoring session: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Sign in with Google Account
  Future<bool> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        _currentUser = UserSession(
          email: googleUser.email,
          displayName: googleUser.displayName ?? 'Business User',
          photoUrl: googleUser.photoUrl,
          isDevMode: false,
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', _currentUser!.email);
        await prefs.setString('user_name', _currentUser!.displayName);
        if (_currentUser!.photoUrl != null) {
          await prefs.setString('user_photo', _currentUser!.photoUrl!);
        }
        await prefs.setBool('user_is_dev', false);

        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Google Sign-In failed: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  /// Local Developer Bypass Mode (Allows testing before Google OAuth configuration)
  Future<void> signInAsDevUser(String name) async {
    _isLoading = true;
    notifyListeners();

    _currentUser = UserSession(
      email: 'owner@local.business',
      displayName: name.trim().isEmpty ? 'Business Owner (Dev)' : name,
      isDevMode: true,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', _currentUser!.email);
    await prefs.setString('user_name', _currentUser!.displayName);
    await prefs.setBool('user_is_dev', true);

    _isLoading = false;
    notifyListeners();
  }

  /// Sign out
  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _googleSignIn.signOut();
    } catch (_) {}

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    _currentUser = null;
    _isLoading = false;
    notifyListeners();
  }
}
