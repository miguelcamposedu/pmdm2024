import 'package:flutter/material.dart';

class CardImageWidget extends StatelessWidget {
  final String imageUrl;

  const CardImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${imageUrl}',
        width: 150,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
