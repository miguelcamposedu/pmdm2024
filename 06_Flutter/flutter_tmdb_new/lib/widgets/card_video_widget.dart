import 'package:flutter/material.dart';
import 'package:flutter_tmdb_new/models/movie_videos_response/movie_trailer.dart';
import 'package:flutter_tmdb_new/pages/video_player_preview_page.dart';
import 'package:transparent_image/transparent_image.dart';

class CardVideoWidget extends StatefulWidget {
  final MovieTrailer movieTrailer;
  const CardVideoWidget({super.key, required this.movieTrailer});

  @override
  State<CardVideoWidget> createState() => _CardVideoWidgetState();
}

class _CardVideoWidgetState extends State<CardVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoPlayerPreviewPage(
                        movieTrailer: widget.movieTrailer,
                      )));
        },
        child: Card(
          child: Stack(children: [
            const Center(child: CircularProgressIndicator()),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://img.youtube.com/vi/${widget.movieTrailer.key}/0.jpg',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            )
          ]),
        ),
      ),
    );
  }
}
