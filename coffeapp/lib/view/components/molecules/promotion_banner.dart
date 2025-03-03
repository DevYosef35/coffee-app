import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
