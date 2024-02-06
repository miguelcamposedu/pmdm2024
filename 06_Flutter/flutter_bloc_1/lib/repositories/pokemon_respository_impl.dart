import 'dart:convert';

import 'package:flutter_bloc_1/models/pokemon_list_response.dart';
import 'package:flutter_bloc_1/repositories/pokemon_repository.dart';
import 'package:http/http.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final Client _client = Client();

  @override
  Future<List<Pokemon>> fetchPokemons() async {
    final response =
        await _client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));
    if (response.statusCode == 200) {
      return PokemonListResponse.fromJson(json.decode(response.body)).results!;
    } else {
      throw Exception('Fail to load pokemons');
    }
  }
}
