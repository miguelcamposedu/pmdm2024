import 'package:flutter_bloc_movies/models/movie_popular_response/movie_popular_response.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchMovies(String type);
  Future<Movie> fetchMovieDetail(int movieId);
}
