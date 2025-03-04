import 'package:flutter/foundation.dart';

class CardViewModel extends ChangeNotifier {
  final List<String> categories = ["Küçük Boy", "Orta Boy", "Büyük Boy"];
  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;
  void updateSelectedCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }

  int? _coffeePrice; // Kahve fiyatı için yeni bir değişken
  int? get coffeePrice => _coffeePrice; // Kahve fiyatını döndüren getter
  void updateCoffeePrice(int coffeePrice) {
    _coffeePrice = coffeePrice; // Kahve fiyatını güncelle
    notifyListeners();
  }

  String? _imgPath; // Resim yolu için yeni bir değişken
  String? get imgPath => _imgPath; // Resim yolunu döndüren getter
  void updateImgPath(String imgPath) {
    _imgPath = imgPath; // Resim yolunu güncelle
    notifyListeners();
  }

  String? _coffeeType; // Kahve tipi için yeni bir değişken
  String? get coffeeType => _coffeeType; // Kahve tipini döndüren getter
  void updateCoffeeType(String coffeeType) {
    _coffeeType = coffeeType; // Kahve tipini güncelle
    notifyListeners();
  }
}
