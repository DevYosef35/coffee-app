import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/core/utility/utility.dart';
import 'package:coffeapp/router/navigation/app_router.dart';
import 'package:lottie/lottie.dart';
import 'components/components.dart';
import 'package:flutter/material.dart';

@RoutePage()
// ignore: must_be_immutable
class OrderView extends StatelessWidget {
  const OrderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 38;
    return Scaffold(
      body: SingleChildScrollView(
        //controller: controller,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/lottie/coffee_received_animation.json",
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
              CustomSpacer(),
              HeadlineSmallText(
                StringConstant.orderReceivedText,
              ),
              Text(StringConstant.orderingText),
              CustomSpacer(
                height: height,
              ),
              CustomButton(
                navigatorWidget: () {
                  context.router.replaceAll([const HomeRoute()]);
                },
                buttonText: StringConstant.returnToHomePageText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
