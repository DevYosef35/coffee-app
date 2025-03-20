import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/core/utility/utility.dart';
import 'package:coffeapp/view/components/molecules/custom_floating_action_button.dart';
import 'package:coffeapp/view/components/molecules/filtrations_buttons.dart';
import 'package:coffeapp/view/components/organism/coffee_list_view.dart';
import 'package:coffeapp/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initialize(context);
    });
  }

  Widget _buildOffstageNavigator({
    required GlobalKey<NavigatorState> navigatorKey,
    required bool isActive,
    required Widget child,
  }) {
    return Offstage(
      offstage: !isActive,
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) => Scaffold(
          floatingActionButton: const CustomFloatingActionButton(),
          bottomNavigationBar: _CustomBottomNavigationBar(viewModel: viewModel),
          body: Stack(
            children: List.generate(viewModel.tabs.length, (index) {
              return _buildOffstageNavigator(
                navigatorKey: viewModel.getNavigatorKey(index),
                isActive: viewModel.isActiveTab(index),
                child: viewModel.tabs[index],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  final HomeViewModel viewModel;

  const _CustomBottomNavigationBar({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: viewModel.onItemTapped,
      currentIndex: viewModel.selectedIndex,
      selectedItemColor: ColorConstants.beige,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Sepet"),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Profil"),
      ],
    );
  }
}

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    //  final products = productProvider.products;
    return Padding(
      padding: AppTheme.getSafePadding(context),
      child: const Column(
        children: [
          PromotionBanner(),
          FiltrationsButtons(),
          CoffeListView(),
        ],
      ),
    );
  }
}
