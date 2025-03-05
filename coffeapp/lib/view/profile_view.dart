import 'package:coffeapp/core/utility/constant/string_constant.dart';
import 'package:flutter/material.dart';
import 'components/atoms/atomic_widgets.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.profile),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            Divider(),
            _buildPaymentInfo(),
            Divider(),
            _buildLoyaltyProgram(),
            Divider(),
            _buildLogout(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// Kullanıcı Bilgileri Bölümü
  Widget _buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
              radius: 50, backgroundImage: AssetImage('assets/profile.jpg')),
          SizedBox(height: 10),
          Text("Yusuf Çetin",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("yusuf@mail.com", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: Text("Edit Profile")),
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
      onTap: () {},
      iconColor: Colors.red,
    );
  }
}
