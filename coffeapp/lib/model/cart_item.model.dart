class CartItemModel {
  final String id;
  final String name;
  final String category;
  final String size;
  final String image;
  final int quantity;
  final double price;

  CartItemModel({
    required this.price,
    required this.image,
    required this.id,
    required this.name,
    required this.category,
    required this.size,
    this.quantity = 1,
  });

  CartItemModel copyWith({
    String? id,
    String? name,
    String? image,
    String? category,
    Map<String, double>? size,
    int? quantity,
  }) {
    return CartItemModel(
      price: price,
      image: image ?? this.image,
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      size: size!.entries.first.key,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'size': size,
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      price: json['price'],
      image: json['image'],
      id: json['id'],
      name: json['name'],
      category: json['category'],
      size: json['size'],
      quantity: json['quantity'],
    );
  }
}
