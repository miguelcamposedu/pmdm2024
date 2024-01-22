import 'package:flutter/material.dart';
import 'package:flutter_http_get_one/models/character_response/character_response.dart';
import 'package:flutter_http_get_one/widgets/character_item.dart';
import 'package:http/http.dart' as http;

Future<CharacterResponse> fetchCharacter() async {
  final response = await http
      .get(Uri.parse('https://rickandmortyapi.com/api/character/435'));

  if (response.statusCode == 200) {
    return CharacterResponse.fromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

class CharacterWidget extends StatefulWidget {
  const CharacterWidget({super.key});

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  late Future<CharacterResponse> character;

  @override
  void initState() {
    super.initState();
    character = fetchCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<CharacterResponse>(
        future: character,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CharacterItem(character: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
