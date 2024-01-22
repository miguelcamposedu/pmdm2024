import 'package:flutter/material.dart';
import 'package:flutter_http_get_one/models/character_response/character_response.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final CharacterResponse character;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(character.image!),
          Text(character.name!),
        ],
      ),
    );
  }
}
