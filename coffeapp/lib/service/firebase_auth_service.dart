import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser {
    return FirebaseAuth.instance.currentUser;
  }

  // Email ile giriş
  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } catch (e) {
      debugPrint("Email ile giriş hatası: $e");
    }
  }

  // Çıkış yap
  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
