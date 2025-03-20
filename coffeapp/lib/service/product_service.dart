// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Tüm ürünleri getir
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();
      return snapshot.docs
          .map((doc) => ProductModel.fromDocument(doc))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  // Belirli bir kategoriye ait ürünleri getir
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      final snapshot = await _firestore
          .collection('products')
          .where('category', isEqualTo: category)
          .get();
      return snapshot.docs
          .map((doc) => ProductModel.fromDocument(doc))
          .toList();
    } catch (e) {
      print('Error fetching products by category: $e');
      return [];
    }
  }

  // Eğer tek bir ürün detayı çekecekseniz:
  Future<ProductModel?> getProductById(String productId) async {
    try {
      final doc = await _firestore.collection('products').doc(productId).get();
      if (!doc.exists) return null;
      return ProductModel.fromDocument(doc);
    } catch (e) {
      print('Error fetching product by id: $e');
      return null;
    }
  }
}
