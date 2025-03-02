import 'package:coffeapp/core/utility/theme/app_theme_data.dart';
import 'package:coffeapp/view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme().themeData,
        debugShowCheckedModeBanner: false,
        home: const HomeView());
  }
}
