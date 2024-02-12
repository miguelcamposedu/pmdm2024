import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_movies/models/response/movie_popular_response.dart';
import 'package:flutter_bloc_movies/repositories/movies/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository movieRepository;

  MoviesBloc(this.movieRepository) : super(MoviesInitial()) {
    on<MovieFetchList>(_onMovieFetchList);
  }

  void _onMovieFetchList(
      MovieFetchList event, Emitter<MoviesState> emit) async {
    try {
      final movieList = await movieRepository.fetchMovies(event.type);
      emit(MovieFetchSuccess(movieList));
      return;
    } on Exception catch (e) {
      emit(MovieFetchError(e.toString()));
    }
  }
}
