// ignore_for_file: use_build_context_synchronously

import 'package:coffeapp/view/home_view.dart';

import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );

        if (result != null) {
          // QR kod verisini kullan
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('QR Kodu: $result')),
          );
        }
        // BUARAYI PROFİL SAYFASINDAKİ ÇIKIŞA EKLE!! await FirebaseAuth.instance.signOut();
      },
      child: const Icon(
        Icons.qr_code,
        color: Colors.white,
      ),
    );
  }
}
