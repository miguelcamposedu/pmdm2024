import 'package:flutter/material.dart';
import 'package:flutter_tmdb_navigation/models/movie_videos_response/movie_videos_response.dart';
import 'package:flutter_tmdb_navigation/widgets/card_video_widget.dart';
import 'package:flutter_tmdb_navigation/pages/video_player_preview_page.dart';
import 'package:http/http.dart' as http;

Future<MovieVideosResponse> fetchTrailers(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$id/videos?api_key=433d2c486572afb242c6fe7c1ddc6771'));

  if (response.statusCode == 200) {
    return MovieVideosResponse.fromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

class MovieTrailersListWidget extends StatefulWidget {
  final int movieId;
  const MovieTrailersListWidget({super.key, required this.movieId});

  @override
  State<MovieTrailersListWidget> createState() =>
      _MovieTrailersListWidgetState();
}

class _MovieTrailersListWidgetState extends State<MovieTrailersListWidget> {
  late Future<MovieVideosResponse> futureTrailers;

  @override
  void initState() {
    super.initState();
    futureTrailers = fetchTrailers(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieVideosResponse>(
      future: futureTrailers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardVideoWidget(
                      movieTrailer: snapshot.data!.results![index]);
                },
              ));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
