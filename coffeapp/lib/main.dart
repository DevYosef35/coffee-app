import 'package:coffeapp/core/utility/theme/app_theme_data.dart';
import 'package:coffeapp/view/home_view.dart';
import 'package:coffeapp/viewmodel/card_quantity_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodel/card_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CardQuantityViewModel>(
        create: (_) => CardQuantityViewModel()),
    ChangeNotifierProvider<CardViewModel>(create: (_) => CardViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme().themeData,
        debugShowCheckedModeBanner: false,
        home: const HomeView());
  }
}
