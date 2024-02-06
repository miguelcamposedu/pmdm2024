part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState {
  final List<Pokemon> pokemons;

  const PokemonState({
    this.pokemons = const <Pokemon>[],
  });
}

final class PokemonInitial extends PokemonState {}

final class PokemonFetched extends PokemonState {
  final List<Pokemon> pokemonList;
  const PokemonFetched(this.pokemonList);
}

final class PokemonFetchError extends PokemonState {
  final String messageError;
  const PokemonFetchError(this.messageError);
}
