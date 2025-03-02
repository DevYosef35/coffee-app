import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:flutter/material.dart';

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
                  builder: (BuildContext context) {
                    return Container(
                      color: ColorConstants.offWhite,
                    );
                  },
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorConstants.darkBrown),
                  minimumSize: MaterialStateProperty.all(Size(100, 40))),
              child: Text("Ekle",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white)))
        ],
      ),
    );
  }
}
