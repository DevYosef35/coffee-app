import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage(PageController controller) {
    if (_currentPage < 2) {
      controller.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLast(PageController controller) {
    controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
