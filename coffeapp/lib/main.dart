import 'package:coffeapp/core/utility/theme/app_theme_data.dart';
import 'package:coffeapp/initiliaze/app_init.dart';
import 'package:coffeapp/router/navigation/app_router.dart';
import 'package:coffeapp/viewmodel/auth_providers.dart';
import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:coffeapp/viewmodel/home_view_model.dart';
import 'package:coffeapp/viewmodel/product_provider.dart';
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
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        ChangeNotifierProvider<CartViewModel>(create: (_) => CartViewModel()),
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
      title: "Robo Brew",
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
