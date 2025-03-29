import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/view/home_view.dart';
import 'package:coffeapp/view/onboarding_view.dart';
import 'package:coffeapp/view/order_view.dart';
import 'package:coffeapp/view/profile_view.dart';
import 'package:coffeapp/view/shopping_cart_view.dart';
import 'package:coffeapp/view/auth_view.dart';
import 'package:flutter/material.dart'; // veya widgets.dart
import 'package:coffeapp/view/splash_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: AuthRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: ShoppingCartRoute.page),
        AutoRoute(page: OrderRoute.page)
      ];
}
