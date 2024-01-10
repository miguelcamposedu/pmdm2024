import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Hola';

    return Container(
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thumb_up),
          const Divider(
            height: 200,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.only(left: 20),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
