// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/router/navigation/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Future.microtask(() => context.router.replace(const HomeRoute()));
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return const _AuthScreen();
  }
}

class _AuthScreen extends StatefulWidget {
  const _AuthScreen();

  @override
  State<_AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<_AuthScreen> {
  bool isLogin = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset("assets/lottie/coffee_lottie.json",
                      height: 200),
                ),
                Text(
                  isLogin ? 'Giriş Yap' : 'Kayıt Ol',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D241F),
                  ),
                ),
                const SizedBox(height: 16),
                if (!isLogin)
                  _StyledTextField(
                      hintText: 'İsim',
                      filled: true,
                      controller: nameController),
                if (!isLogin) const SizedBox(height: 16),
                if (!isLogin)
                  _StyledTextField(
                      hintText: 'Soyisim', controller: surnameController),
                if (!isLogin) const SizedBox(height: 16),
                _StyledTextField(
                    hintText: 'Eposta', controller: emailController),
                const SizedBox(height: 16),
                _StyledTextField(
                    hintText: 'Şifre',
                    obscureText: true,
                    controller: passwordController),
                const SizedBox(height: 24),
                _PrimaryButton(
                  label: isLogin ? 'Giriş Yap' : 'Kayıt Ol',
                  onPressed: () async {
                    try {
                      if (isLogin) {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      } else {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        await FirebaseAuth.instance.currentUser
                            ?.updateDisplayName(
                          '${nameController.text} ${surnameController.text}',
                        );
                      }
                      if (mounted) {
                        context.router.replace(const HomeRoute());
                      }
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message ?? 'Bir hata oluştu')),
                      );
                    }
                  },
                ),
                const SizedBox(height: 24),
                const _SocialIcons(),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin
                          ? 'Hesabın yok mu? Kayıt Ol'
                          : 'Zaten hesabın var mı? Giriş Yap',
                      style: const TextStyle(color: Color(0xFF3D241F)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StyledTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool filled;
  final TextEditingController? controller;

  const _StyledTextField({
    required this.hintText,
    this.obscureText = false,
    this.filled = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: filled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFCE8D4D)),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _PrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3D241F),
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}

class _SocialIcons extends StatelessWidget {
  const _SocialIcons();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.g_mobiledata, size: 36),
        SizedBox(width: 16),
        Icon(Icons.facebook, size: 28),
        SizedBox(width: 16),
        Icon(Icons.apple, size: 28),
      ],
    );
  }
}
