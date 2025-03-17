import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeapp/model/category_model.dart';
import 'package:coffeapp/view/components/organism/organisms_widgets.dart';
import 'package:coffeapp/viewmodel/coffe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeListView extends StatelessWidget {
  const CoffeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final filteredList = Provider.of<CoffeeProvider>(context).filteredCoffees;
    CollectionReference category =
        FirebaseFirestore.instance.collection('category');
    final response = category.withConverter(fromFirestore: (snapshot, options) {
      final data = snapshot.data()!;
      return Category.fromJson(data);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        itemCount: filteredList.length,
        itemBuilder: (BuildContext context, int index) {
          final coffee = filteredList[index];
          return CardWidget(
            coffee: coffee,
          );
        },
      ),
    );
  }
}
