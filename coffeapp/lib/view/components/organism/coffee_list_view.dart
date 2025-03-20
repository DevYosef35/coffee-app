import 'package:coffeapp/model/product_model.dart';
import 'package:coffeapp/view/components/organism/organisms_widgets.dart';
import 'package:coffeapp/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeListView extends StatelessWidget {
  const CoffeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return CardWidget(
            product: ProductModel(
                sizes: products[index].sizes,
                id: products[index].id,
                category: products[index].category,
                name: products[index].name,
                image: products[index].image,
                basePrice: products[index].basePrice),
          );
        },
      ),
    );
  }
}




/*  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeapp/model/category_model.dart';
CollectionReference category =
        FirebaseFirestore.instance.collection('category');
    final response = category.withConverter(fromFirestore: (snapshot, options) {
      final data = snapshot.data()!;
      return Category.fromJson(data);
    }, toFirestore: (value, options) {
      return value.toJson();
    });*/