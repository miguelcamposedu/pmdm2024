import 'package:flutter_bloc_1/models/pokemon_list_response.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetchPokemons();
}
