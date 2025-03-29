import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/initiliaze/app_init.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppInit.handleInitialRouting(
          context); // ✅ context hazırlandıktan sonra çağrılır
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/lottie/coffee_lottie.json")),
    );
  }
}
