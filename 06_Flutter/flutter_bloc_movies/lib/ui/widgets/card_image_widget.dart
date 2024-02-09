import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc_movies/models/movie_popular_response/movie_popular_response.dart';
import 'package:flutter_bloc_movies/ui/pages/movie_detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

class CardImageWidget extends StatelessWidget {
  final Movie movie;
  final int index;

  const CardImageWidget({super.key, required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    int delay = 100 * index;

    return SizedBox(
      width: 150,
      height: 300,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailPage(
                      movieId: movie.id!,
                    )),
          );
        },
        onDoubleTap: () {},
        child: Card(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              /*child: Image.network(
              'https://image.tmdb.org/t/p/w500${imageUrl}',
              width: 150,
              height: 300,
              fit: BoxFit.cover,
            ).animate(delay: Duration(milliseconds: delay)).fade(duration: 1500.ms),
            */
              child: Stack(
                children: [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(0.8),
                      ),
                      child: Center(
                        child: Text(movie.voteAverage!.toStringAsFixed(1),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
