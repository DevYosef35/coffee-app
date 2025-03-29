import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/router/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/utility/constant/constant.dart';
import 'components/atoms/atomic_widgets.dart';

@RoutePage()
class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 38;
    return Scaffold(
      body: SizedBox.expand(
        // Tüm ekranı kapsasın
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortala
          crossAxisAlignment: CrossAxisAlignment.center, // Yatayda ortala
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
            CustomSpacer(height: height),
            CustomButton(
              navigatorWidget: () {
                context.router.replaceAll([const HomeRoute()]);
              },
              buttonText: StringConstant.returnToHomePageText,
            ),
          ],
        ),
      ),
    );
  }
}
