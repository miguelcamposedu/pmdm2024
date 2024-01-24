import 'package:flutter/material.dart';
import 'package:flutter_tmdb_navigation/widgets/top_rated_movie_list_widget.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: double.infinity,
      child: ListView(
        children: const [TopRatedMovieListWidget()],
      ),
    );
  }
}
