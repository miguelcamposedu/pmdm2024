import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.verified_user),
          title: const Text('Listado')),
      body: ListView(
        children: [
          Container(
            height: 150,
            color: Colors.red,
            child: const Center(child: Text('Item 1')),
          ),
          Container(
            height: 150,
            color: Colors.orange,
            child: const Center(child: Text('Item 2')),
          ),
          Container(
            height: 150,
            color: Colors.yellow,
            child: const Center(child: Text('Item 3')),
          ),
          Container(
            height: 150,
            color: Colors.lightGreen,
            child: const Center(child: Text('Item 4')),
          ),
          Container(
            height: 150,
            color: Colors.lightBlue,
            child: const Center(child: Text('Item 5')),
          ),
          Container(
            height: 150,
            color: Colors.purple,
            child: const Center(child: Text('Item 6')),
          )
        ],
      ),
    );
  }
}
