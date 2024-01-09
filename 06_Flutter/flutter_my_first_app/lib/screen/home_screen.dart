import 'package:flutter/material.dart';
import 'package:flutter_my_first_app/widget/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My first app'),
      ),
      body: Container(alignment: Alignment.center, child: const MyButton()),
    );
  }
}
