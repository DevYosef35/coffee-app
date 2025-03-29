import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/firebase_options.dart';
import 'package:coffeapp/router/navigation/app_router.dart';
import 'package:coffeapp/viewmodel/auth_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);
  }

  static Future<void> handleInitialRouting(BuildContext context) async {
    final authViewModel = AuthProviders();
    final prefs = await SharedPreferences.getInstance();
    final onboardingSeen = prefs.getBool('onboarding_shown') ?? false;

    await Future.delayed(const Duration(seconds: 4));

    if (!onboardingSeen) {
      context.router.replace(OnboardingRoute());
    } else if (!authViewModel.isSignedIn) {
      context.router.replace(const AuthRoute());
    } else {
      context.router.replace(const HomeRoute());
    }
  }
}
