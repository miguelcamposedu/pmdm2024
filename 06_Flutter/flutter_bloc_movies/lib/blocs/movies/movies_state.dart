part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MovieFetchSuccess extends MoviesState {
  final List<Movie> movieList;
  MovieFetchSuccess(this.movieList);
}

final class MovieFetchError extends MoviesState {
  final String errorMessage;
  MovieFetchError(this.errorMessage);
}
