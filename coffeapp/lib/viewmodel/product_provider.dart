import 'package:flutter/material.dart';
import '../model/product_model.dart';
import '../service/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();
  ProductModel? _selectedProduct;
  ProductModel? get selectedProduct => _selectedProduct;
  String? _selectedid;

  List<ProductModel> _allProducts = []; // tüm ürünler burada tutulur
  List<ProductModel> _filteredProducts =
      []; // seçilen kategoriye göre filtrelenmiş ürünler
  bool _isLoading = false;

  List<ProductModel> get products => _filteredProducts;
  bool get isLoading => _isLoading;
  String? get selectedCategory => _selectedid;
  String? _selectedSize;
  String? get selectedSize => _selectedSize;

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  double getSelectedPrice(ProductModel product) {
    if (_selectedSize != null && product.sizes.containsKey(_selectedSize)) {
      return product.sizes[_selectedSize]!;
    }
    return product.basePrice;
  }

  // Tüm ürünleri Firestore'dan çek
  Future<void> fetchAllProducts() async {
    _isLoading = true;
    notifyListeners();

    _allProducts = await _productService.getAllProducts();
    _filteredProducts = _allProducts; // başlangıçta hepsi gösterilsin

    _isLoading = false;
    notifyListeners();
  }

  // Kategori seçiminde filtreleme yap
  void selectCategory(String? id) {
    _selectedid = id;

    if (id == null || id == 'all') {
      _filteredProducts = _allProducts;
    } else {
      _filteredProducts =
          _allProducts.where((product) => product.id == id).toList();
    }

    notifyListeners();
  }

  // Ürün seçimi (detay için)
  void selectProduct(ProductModel product) {
    _selectedProduct = product;
    notifyListeners();
  }

  // Tüm kategorileri ürünlerden türet
  List<String> get categories {
    final categorySet = _allProducts.map((e) => e.id).toSet();
    return ['all', ...categorySet];
  }
}
