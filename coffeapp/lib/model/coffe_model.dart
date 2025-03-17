import 'package:coffeapp/model/coffe_type.dart';

class Coffee {
  final String name;
  final String imgPath;
  final String size;
  final int price;
  final CoffeeType type;
  final int quantity;

  Coffee({
    required this.name,
    required this.price,
    required this.size,
    required this.type,
    required this.imgPath,
    this.quantity = 1,
  });

  Coffee copyWith({
    String? name,
    int? price,
    String? imgPath,
    String? size,
    CoffeeType? type,
    int? quantity,
  }) {
    return Coffee(
      name: name ?? this.name,
      price: price ?? this.price,
      type: type ?? this.type,
      imgPath: imgPath ?? this.imgPath,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }
}
