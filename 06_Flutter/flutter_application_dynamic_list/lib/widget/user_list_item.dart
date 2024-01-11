import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final String name;
  final int age;

  const UserListItem({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 100, child: Center(child: Text(name)));
  }
}
