import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_1/models/pokemon_list_response.dart';
import 'package:flutter_bloc_1/repositories/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;

  PokemonBloc(this.pokemonRepository) : super(PokemonInitial()) {
    on<PokemonsFetchEvent>(_onPokemonFetch);
  }

  void _onPokemonFetch(
      PokemonsFetchEvent event, Emitter<PokemonState> emit) async {
    try {
      final pokemonList = await pokemonRepository.fetchPokemons();
      emit(PokemonFetched(pokemonList));
      return;
    } on Exception catch (e) {
      emit(PokemonFetchError(e.toString()));
    }
  }
}
