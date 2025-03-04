import 'package:coffeapp/model/coffe_type.dart';

String getCoffeeImage(CoffeeType type) {
  switch (type) {
    case CoffeeType.americano:
      return 'assets/americano_coffe_cup.jpg';
    case CoffeeType.latte:
      return 'assets/latte_coffee_cup.jpg';
    case CoffeeType.cappuccino:
      return 'assets/mocha_coffe_cup.jpg';
    // Diğer kahve türleri için resim yollarını buraya ekleyin
    default:
      return 'assets/americano_coffe_cup_jpg'; // Varsayılan resim
  }
}
