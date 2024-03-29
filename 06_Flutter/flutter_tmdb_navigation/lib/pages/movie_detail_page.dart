import 'package:flutter/material.dart';
import 'package:flutter_tmdb_navigation/models/movie_detail_response/movie_detail_response.dart';
import 'package:flutter_tmdb_navigation/models/movie_videos_response/movie_videos_response.dart';
import 'package:flutter_tmdb_navigation/widgets/movie_trailers_list_widget.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

Future<MovieDetailResponse> fetchMovie(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$id?api_key=433d2c486572afb242c6fe7c1ddc6771'));

  if (response.statusCode == 200) {
    return MovieDetailResponse.fromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late Future<MovieDetailResponse> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie = fetchMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie Detail'),
        ),
        body: FutureBuilder<MovieDetailResponse>(
          future: futureMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image:
                              'https://image.tmdb.org/t/p/w500${snapshot.data!.backdropPath}',
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MovieTrailersListWidget(movieId: snapshot.data!.id!)
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ));
  }
}
