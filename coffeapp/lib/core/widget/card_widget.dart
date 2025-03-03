import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:coffeapp/core/widget/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardWidget extends StatefulWidget {
  const CardWidget(
      {super.key,
      required this.coffeName,
      required this.coffePrice,
      required this.imgPath});
  final String coffeName;
  final String imgPath;
  final int coffePrice;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final List<String> categories = ["küçük", "orta", "nüyük"];
  String selectedCategory = "küçük";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              widget.imgPath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(widget.coffeName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorConstants.darkBrown,
                      fontWeight: FontWeight.bold)),
              Text(widget.coffePrice.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorConstants.darkBrown,
                      fontWeight: FontWeight.bold))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setModalState) {
                        return Column(
                          children: [
                            Image.asset("assets/americano_coffe_cup.jpg"),
                            Text(
                              "Americano",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: ColorConstants.darkBrown,
                                      fontWeight: FontWeight.w700),
                            ),
                            Wrap(
                              spacing: 8.0,
                              children: categories.map((category) {
                                return ChipWidget(
                                  label: category,
                                  isSelected: selectedCategory == category,
                                  onSelected: (bool selected) {
                                    // Artık içte tanımlanan fonksiyona gerek yok, direkt setModalState kullanıyoruz.
                                    setModalState(() {
                                      selectedCategory = category;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorConstants.darkBrown),
                  minimumSize: MaterialStateProperty.all(Size(100, 40))),
              child: Text(AppStrings.buttonText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white)))
        ],
      ),
    );
  }
}
