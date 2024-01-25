import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_tmdb_navigation/pages/movie_detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

class CardImageWidget extends StatelessWidget {
  final int movieId;
  final String imageUrl;
  final int index;

  const CardImageWidget(
      {super.key,
      required this.movieId,
      required this.imageUrl,
      required this.index});

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
                      movieId: movieId,
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
                    image: 'https://image.tmdb.org/t/p/w500$imageUrl',
                    width: 150,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
