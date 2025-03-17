import 'package:coffeapp/service/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class AuthProviders extends ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();

  bool get isSignedIn => _authService.currentUser != null;

  Future<void> signInWithEmail(String email, String password) async {
    await _authService.signInWithEmail(email, password);
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authService.signOut();
    notifyListeners();
  }
}
