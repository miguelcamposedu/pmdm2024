part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {}

final class PokemonsFetchEvent extends PokemonEvent {}
