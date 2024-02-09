import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/blocs/movies/movies_bloc.dart';
import 'package:flutter_bloc_movies/repositories/movies/movie_repository.dart';
import 'package:flutter_bloc_movies/repositories/movies/movie_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movies/ui/widgets/card_image_widget.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late MovieRepository movieRepository;
  late MoviesBloc _moviesBloc;
  String title = 'Popular';

  @override
  void initState() {
    movieRepository = MovieRepositoryImpl();
    _moviesBloc = MoviesBloc(movieRepository)..add(MovieFetchList('popular'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _moviesBloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7, mainAxisSpacing: 5.0),
            itemCount: state.movieList.length,
            itemBuilder: (context, index) {
              final movie = state.movieList[index];
              return CardImageWidget(movie: movie, index: index);
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
                  title: const Row(
                    children: [
                      Icon(Icons.movie),
                      Text('Popular'),
                    ],
                  ),
                  onTap: () {
                    _moviesBloc.add(MovieFetchList('popular'));
                    setState(() {
                      title = 'Popular';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.arrow_upward),
                      Text('Top rated'),
                    ],
                  ),
                  onTap: () {
                    _moviesBloc.add(MovieFetchList('top_rated'));
                    setState(() {
                      title = 'Top rated';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.star),
                      Text('Upcoming'),
                    ],
                  ),
                  onTap: () {
                    _moviesBloc.add(MovieFetchList('upcoming'));
                    setState(() {
                      title = 'Upcoming';
                    });
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
