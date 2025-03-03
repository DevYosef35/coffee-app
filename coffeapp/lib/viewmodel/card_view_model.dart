import 'package:flutter/foundation.dart';

class CardViewModel extends ChangeNotifier {
  final List<String> categories = ["Küçük", "Orta", "Büyük"];
  String? _selectedCategory;

  String? get selectedCategory => _selectedCategory;

  void updateSelectedCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }
}
