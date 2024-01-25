import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_tmdb_navigation/pages/models/top_rated_movie_response/top_movie.dart';
import 'package:flutter_tmdb_navigation/pages/models/top_rated_movie_response/top_rated_movie_response.dart';
import 'package:flutter_tmdb_navigation/widgets/card_image_widget.dart';
import 'package:http/http.dart' as http;

Future<TopRatedMovieResponse> fetchTopRatedMovies() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=433d2c486572afb242c6fe7c1ddc6771'));

  if (response.statusCode == 200) {
    return TopRatedMovieResponse.fromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

class TopRatedMovieListWidget extends StatefulWidget {
  const TopRatedMovieListWidget({super.key});

  @override
  State<TopRatedMovieListWidget> createState() =>
      _TopRatedMovieListWidgetState();
}

class _TopRatedMovieListWidgetState extends State<TopRatedMovieListWidget> {
  late Future<TopRatedMovieResponse> futureTopRatedMovie;

  @override
  void initState() {
    super.initState();
    futureTopRatedMovie = fetchTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Top Rated Movies',
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.start,
      ).animate().fade(duration: 1500.ms),
      const SizedBox(
        height: 10,
      ),
      FutureBuilder<TopRatedMovieResponse>(
        future: futureTopRatedMovie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  return CardImageWidget(
                      movieId: snapshot.data!.results![index].id!,
                      imageUrl: snapshot.data!.results![index].posterPath!,
                      index: index);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    ]);
  }
}
