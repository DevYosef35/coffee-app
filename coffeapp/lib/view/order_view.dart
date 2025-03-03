import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:coffeapp/view/components/atoms/custom_button.dart';
import 'package:coffeapp/view/components/atoms/custom_spacer_widget.dart';
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
    return Scaffold(
      backgroundColor: ColorConstants.offWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(widget.imgPath),
          const CustomSpacer(),
          Text(
            StringConstant.orderReceivedText,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ColorConstants.darkBrown, fontWeight: FontWeight.bold),
          ),
          Text(StringConstant.orderingText),
          const CustomSpacer(),
          CustomButton(
            navigatorWidget: const HomeView(),
            buttonText: StringConstant.returnToHomePageText,
          )
        ],
      ),
    );
  }
}
