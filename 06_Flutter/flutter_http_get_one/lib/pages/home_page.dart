import 'package:flutter/material.dart';
import 'package:flutter_http_get_one/widgets/character_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ricky & Morty'),
      ),
      body: const CharacterWidget(),
    );
  }
}
