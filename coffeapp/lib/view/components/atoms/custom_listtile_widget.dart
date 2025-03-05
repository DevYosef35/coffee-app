import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
