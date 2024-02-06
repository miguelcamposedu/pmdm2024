import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_tmdb_new/models/top_rated_movie_response/top_rated_movie_response.dart';
import 'package:flutter_tmdb_new/services/movie_service.dart';
import 'package:flutter_tmdb_new/widgets/card_image_widget.dart';

class TopRatedMovieListWidget extends StatefulWidget {
  const TopRatedMovieListWidget({super.key});

  @override
  State<TopRatedMovieListWidget> createState() =>
      _TopRatedMovieListWidgetState();
}

class _TopRatedMovieListWidgetState extends State<TopRatedMovieListWidget> {
  late Future<TopRatedMovieResponse> futureTopRatedMovie;

  final chopper = ChopperClient(
    baseUrl: Uri.parse("https://api.themoviedb.org/3"),
    services: [MovieService.create()],
  );
  final movieService = chopper.getService<MovieService>();

  @override
  Future<void> initState() async {
    super.initState();
    futureTopRatedMovie = movieService.getPopular();
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
