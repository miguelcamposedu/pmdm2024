import 'package:flutter/material.dart';
import 'package:flutter_application_dynamic_list/widget/user_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [
        UserListItem(name: 'Juan', age: 29),
        UserListItem(name: 'Pepe', age: 29),
        UserListItem(name: 'María', age: 29),
        UserListItem(name: 'Tomás, no me la das', age: 29),
      ]),
    );
  }
}
