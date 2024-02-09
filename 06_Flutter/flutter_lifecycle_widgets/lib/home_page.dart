import 'package:flutter/material.dart';
import 'package:flutter_lifecycle_widgets/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Open route'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailPage()),
          ).then((value) => {
                print('Returned from DetailPage: $value'),
              });
        },
      ),
    );
  }
}
