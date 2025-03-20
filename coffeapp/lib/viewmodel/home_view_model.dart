import 'package:coffeapp/view/home_view.dart';
import 'package:coffeapp/view/profile_view.dart';
import 'package:coffeapp/view/shopping_cart_view.dart';
import 'package:coffeapp/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  final List<GlobalKey<NavigatorState>> navigatorKeys =
      List.generate(3, (_) => GlobalKey<NavigatorState>());

  final List<Widget> tabs = [
    const HomeTabView(),
    const ShoppingCartView(),
    const ProfileView(),
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void initialize(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).fetchAllProducts();
  }

  bool isActiveTab(int index) => _selectedIndex == index;
  GlobalKey<NavigatorState> getNavigatorKey(int index) => navigatorKeys[index];
}
