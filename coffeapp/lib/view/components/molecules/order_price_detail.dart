import 'package:coffeapp/core/utility/constant/constant.dart';
import 'package:coffeapp/view/components/components.dart';
import 'package:coffeapp/viewmodel/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPriceDetails extends StatelessWidget {
  const OrderPriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartViewModel>().cart;

    final double subtotal =
        cartItems.fold(0, (sum, item) => sum + item.quantity * item.price);
    final double tax = subtotal * 0.2;
    const double extras = 0.0; // Şimdilik boş, ileride eklenecek
    final double total = subtotal + tax + extras;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineSmallText(StringConstant.orderAmountText),
        _PriceRow(label: StringConstant.totalAmountText, value: total),
        _PriceRow(label: StringConstant.extrasText, value: extras),
        _PriceRow(label: StringConstant.taxesText, value: tax),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final double value;

  const _PriceRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text('₺${value.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
