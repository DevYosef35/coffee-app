import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/atoms/atomic_widgets.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.profile),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogout(),
          ],
        ),
      ),
    );
  }

  /// Çıkış ve Temizleme Seçenekleri
  Widget _buildLogout() {
    return CustomListTile(
      icon: Icons.logout,
      title: StringConstant.logOut,
      onTap: () {
        FirebaseAuth.instance.signOut();
      },
      iconColor: Colors.red,
    );
  }
}
