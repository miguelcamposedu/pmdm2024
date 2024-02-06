import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/blocs/bloc/pokemon_bloc.dart';
import 'package:flutter_bloc_1/models/pokemon_list_response.dart';
import 'package:flutter_bloc_1/repositories/pokemon_repository.dart';
import 'package:flutter_bloc_1/repositories/pokemon_respository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokemonRepository pokemonRepository;

  @override
  void initState() {
    super.initState();
    pokemonRepository = PokemonRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PokemonBloc(pokemonRepository)..add(PokemonsFetchEvent());
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Pokemon List'),
          ),
          body: _pokemonView(context)),
    );
  }

  Widget _pokemonView(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state is PokemonInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PokemonFetchError) {
          return Column(
            children: [
              Text(state.messageError),
              ElevatedButton(
                onPressed: () {
                  context.watch<PokemonBloc>().add(PokemonsFetchEvent());
                },
                child: const Text('Retry'),
              )
            ],
          );
        } else if (state is PokemonFetched) {
          return _pokemonListView(context, state.pokemonList);
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  Widget _pokemonListView(BuildContext context, List<Pokemon> pokemonList) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png'),
                    Text(pokemonList[index].name!.toUpperCase()),
                  ],
                )));
      },
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      itemCount: pokemonList.length,
    );
  }
}
