import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/core/utility/constant/color_constant.dart';
import 'package:coffeapp/core/utility/constant/constant.dart';
import 'package:coffeapp/router/navigation/app_router.dart';
import 'package:coffeapp/view/components/atoms/product_name_text_widget.dart';
import 'package:coffeapp/viewmodel/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final PageController _pageController = PageController();

  final List<String> _titles = [
    StringConstant.onBoardingTitleQuality,
    StringConstant.onBoardingTitleSpecs,
    StringConstant.onBoardingTitleTime
  ];

  final List<String> _subtitles = [
    "Robotik sistemimiz, her seferinde mükemmel lezzet için aynı tarifi uygular.",
    "Önceden sipariş ver, yıldız topla, ödülleri kap.",
    "Favorilerini öğreniyor, sana özel kahve sunuyoruz.",
  ];

  final String _lottieAssets = 'assets/lottie/coffee_lottie.json';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // Üst Progress Divider'lar
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        bool isActive = index <= viewModel.currentPage;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 6.0),
                          height: 4,
                          width: 40,
                          decoration: BoxDecoration(
                            color: isActive ? Colors.white : Colors.white38,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),

                  // Skip Button
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: TextButton(
                        onPressed: () {
                          viewModel.skipToLast(_pageController);
                        },
                        child: ProductNameWidget(text: StringConstant.skip),
                      ),
                    ),
                  ),

                  // Sayfalar
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: viewModel.setPage,
                      itemCount: _titles.length,
                      itemBuilder: (context, index) {
                        String currentTitle = _titles[index];
                        String currentSubtitle = _subtitles[index];
                        String currentLottie = _lottieAssets;

                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Lottie.asset(
                                  currentLottie,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 24),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 600),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(0.0, 0.2),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  );
                                },
                                child: Text(
                                  currentTitle,
                                  key: ValueKey(currentTitle),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: ColorConstants.darkBrown,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 600),
                                child: Text(
                                  currentSubtitle,
                                  key: ValueKey(currentSubtitle),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstants.darkBrown,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Next / Get Started Button
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (viewModel.currentPage == 2) {
                            context.router.replace(const AuthRoute());
                          } else {
                            viewModel.nextPage(_pageController);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.darkBrown,
                          foregroundColor: ColorConstants.offWhite,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                            viewModel.currentPage == 2 ? "Başla" : "İleri"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // backgroundColor: const Color(0xFF2A7A5E),
          );
        },
      ),
    );
  }
}
