import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String category;
  final String name;
  final String image;
  final Map<String, double> sizes;
  final double basePrice;

  ProductModel({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.basePrice,
    required this.sizes,
  });

  factory ProductModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Customization içinden sizes'ı çek
    final customization = data['customazition'] as Map<String, dynamic>?;

    // Eğer customization veya sizes null gelirse hata fırlat
    if (customization == null || customization['sizes'] == null) {
      throw Exception(
          "Product ${doc.id} is missing customization or sizes field.");
    }

    // Tip güvenli şekilde Map<String, double> çevir
    final rawSizes = customization['sizes'] as Map<String, dynamic>;
    final sizes = rawSizes.map(
      (key, value) => MapEntry(key, (value as num).toDouble()),
    );

    return ProductModel(
      id: doc.id,
      category: data['category'] ?? '',
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      basePrice: (data['basePrice'] ?? 0).toDouble(),
      sizes: sizes,
    );
  }
}
