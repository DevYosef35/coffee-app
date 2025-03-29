// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.qr_code,
        color: Colors.white,
      ),
    );
  }
}
