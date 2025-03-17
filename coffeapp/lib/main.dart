import 'package:coffeapp/core/utility/theme/app_theme_data.dart';
import 'package:coffeapp/initiliaze/app_init.dart';
import 'package:coffeapp/router/navigation/app_router.dart';
import 'package:coffeapp/viewmodel/auth_providers.dart';
import 'package:coffeapp/viewmodel/card_quantity_view_model.dart';
import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:coffeapp/viewmodel/coffe_provider.dart';
import 'package:coffeapp/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await AppInit.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProviders>(create: (_) => AuthProviders()),
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
          lazy: false,
        ),
        ChangeNotifierProvider<CartViewModel>(create: (_) => CartViewModel()),
        ChangeNotifierProvider<CoffeeProvider>(create: (_) => CoffeeProvider()),
        ChangeNotifierProvider<CardQuantityViewModel>(
            create: (_) => CardQuantityViewModel()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
