import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffeapp/core/utility/constant/padding_constant.dart';
import 'package:coffeapp/core/utility/theme/app_theme_data.dart';
import 'package:coffeapp/core/widget/card_widget.dart';
import 'package:coffeapp/core/widget/chip_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = ["All", "Latte", "Americano", "Mocha"];
  String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppTheme.getSafePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return ChipWidget(
            label: category,
            isSelected: selectedCategory == category,
            onSelected: (bool selected) {
              setState(() {
                selectedCategory = category;
              });
            },
          );
        },
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
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.9),
        itemCount: 22,
        itemBuilder: (BuildContext context, int index) {
          return const CardWidget(
            imgPath: "assets/americano_coffe_cup.jpg",
            coffeName: "Americano",
            coffePrice: 1,
          );
        },
      ),
    );
  }
}

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [Image.asset("assets/promation_banner.png")],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.3,
        ));
  }
}
