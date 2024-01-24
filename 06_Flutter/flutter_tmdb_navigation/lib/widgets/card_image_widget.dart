import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CardImageWidget extends StatelessWidget {
  final String imageUrl;

  const CardImageWidget({super.key, required this.imageUrl, re});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500${imageUrl}',
          width: 150,
          height: 300,
          fit: BoxFit.cover,
        )
            .animate(delay: const Duration(milliseconds: 500))
            .fade(duration: 1500.ms),
      ),
    );
  }
}
