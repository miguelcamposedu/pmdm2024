import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/blocs/movies/movies_bloc.dart';
import 'package:flutter_bloc_movies/repositories/movies/movie_repository.dart';
import 'package:flutter_bloc_movies/repositories/movies/movie_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late MovieRepository movieRepository;

  @override
  void initState() {
    super.initState();
    movieRepository = MovieRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            MoviesBloc(movieRepository)..add(MovieFetchList('popular')),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Movies'),
            actions: [
              IconButton(
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  icon: const Icon(Icons.filter_list))
            ],
          ),
          body: _movieList(),
        ));
  }

  Widget _movieList() {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MovieFetchSuccess) {
          return ListView.builder(
            itemCount: state.movieList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.movieList[index].originalTitle!),
              );
            },
          );
        } else if (state is MovieFetchError) {
          return Text(state.errorMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Popular'),
                  onTap: () {
                    BlocProvider.of<MoviesBloc>(context)
                        .add(MovieFetchList('popular'));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Top rated'),
                  onTap: () {
                    BlocProvider.of<MoviesBloc>(context)
                        .add(MovieFetchList('top_rated'));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Latest'),
                  onTap: () {
                    BlocProvider.of<MoviesBloc>(context)
                        .add(MovieFetchList('latest'));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
