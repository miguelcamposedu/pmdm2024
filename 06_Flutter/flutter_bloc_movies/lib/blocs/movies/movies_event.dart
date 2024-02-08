part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}

class MovieFetchList extends MoviesEvent {
  final String type;
  MovieFetchList(this.type);
}

class MovieViewDetail extends MoviesEvent {
  final int movieId;
  MovieViewDetail(this.movieId);
}
