import 'package:auto_route/auto_route.dart';
import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
            _buildPaymentInfo(),
            const Divider(),
            _buildLoyaltyProgram(),
            const Divider(),
            _buildLogout(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// Kullanıcı Bilgileri Bölümü
  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
              radius: 50, backgroundImage: AssetImage('assets/profile.jpg')),
          const SizedBox(height: 10),
          const Text("Yusuf Çetin",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("yusuf@mail.com", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text("Edit Profile")),
        ],
      ),
    );
  }

  /// Ödeme Bilgileri Bölümü
  Widget _buildPaymentInfo() {
    return CustomListTile(
        icon: Icons.credit_card, title: "Saved Cards", onTap: () {});
  }

  /// Sadakat Programı Bölümü
  Widget _buildLoyaltyProgram() {
    return CustomListTile(
        icon: Icons.star, title: "Loyalty Points: 120", onTap: () {});
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
