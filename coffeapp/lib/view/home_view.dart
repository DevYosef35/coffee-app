import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/core/utility/utility.dart';
import 'package:coffeapp/viewmodel/coffe_list_provider.dart';
import 'package:coffeapp/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _FloatingActionButton(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            onItemTapped(index);
          },
          currentIndex: selectedIndex,
          selectedItemColor: ColorConstants.beige,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Cart"),
          ]),
      body: Padding(
        padding: AppTheme.getSafePadding(context),
        child: Column(
          children: [
            const PromotionBanner(),
            _filtrationButtons(context),
            const CoffeListView(),
          ],
        ),
      ),
    );
  }

  SizedBox _filtrationButtons(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView.separated(
        padding: PaddingConstant.chipSpacing,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(
            width: 8.0), // Chip'ler arasındaki boşluğu 8.0 olarak ayarla
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return ChipWidget(label: category, category: category);
        },
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.qr_code,
        color: Colors.white,
      ),
    );
  }
}

class CoffeListView extends StatelessWidget {
  const CoffeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.9),
        itemCount: CoffeeProvider().coffeeList.length,
        itemBuilder: (BuildContext context, int index) {
          final coffee = CoffeeProvider().getCoffee(index);
          return CardWidget(
            imgPath: 'assets/${coffee.name.toLowerCase()}_coffe_cup.jpg',
            coffeName: coffee.name,
            coffePrice: coffee.price,
          );
        },
      ),
    );
  }
}
