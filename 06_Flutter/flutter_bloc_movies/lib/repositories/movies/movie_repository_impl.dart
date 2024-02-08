import 'dart:convert';

import 'package:flutter_bloc_movies/models/movie_popular_response/movie_popular_response.dart';
import 'package:flutter_bloc_movies/repositories/movies/movie_repository.dart';
import 'package:http/http.dart';

class MovieRepositoryImpl extends MovieRepository {
  final Client _httpClient = Client();

  @override
  Future<Movie> fetchMovieDetail(int movieId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> fetchMovies(String type) async {
    final response = await _httpClient.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$type?api_key=433d2c486572afb242c6fe7c1ddc6771'));
    if (response.statusCode == 200) {
      return MoviePopularResponse.fromJson(json.decode(response.body)).results!;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
