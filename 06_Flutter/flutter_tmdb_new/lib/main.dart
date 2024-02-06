import 'package:flutter/material.dart';
import 'package:flutter_tmdb_new/pages/home_page.dart';
import 'package:flutter_tmdb_new/services/movie_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<MovieService>(
          : '',
          create: (BuildContext context) => MovieService.create(),
          dispose: (_, MovieService service) => service.client.dispose(),
          child: const HomePage()),
    );
  }
}
