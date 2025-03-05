import 'package:coffeapp/core/utility/utility.dart';
import 'components/components.dart';
import 'package:coffeapp/view/home_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderView extends StatefulWidget {
  OrderView({super.key, required this.imgPath});

  @override
  State<OrderView> createState() => _OrderViewState();
  String imgPath;
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    const double height = 38;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(widget.imgPath),
          CustomSpacer(),
          HeadlineSmallText(
            StringConstant.orderReceivedText,
          ),
          Text(StringConstant.orderingText),
          CustomSpacer(
            height: height,
          ),
          CustomButton(
            navigatorWidget: const HomeView(),
            buttonText: StringConstant.returnToHomePageText,
          )
        ],
      ),
    );
  }
}
