import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
      },
      child: const Icon(
        Icons.qr_code,
        color: Colors.white,
      ),
    );
  }
}
