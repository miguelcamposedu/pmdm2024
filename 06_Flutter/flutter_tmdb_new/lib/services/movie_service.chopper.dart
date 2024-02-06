// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MovieService extends MovieService {
  _$MovieService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MovieService;

  @override
  Future<TopRatedMovieResponse> getPopular() async {
    final Uri $url =
        Uri.parse('/movie/popular?api_key=433d2c486572afb242c6fe7c1ddc6771');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response = await client
        .send<TopRatedMovieResponse, TopRatedMovieResponse>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<TopRatedMovieResponse> getTopRated() async {
    final Uri $url =
        Uri.parse('/movie/toprated?api_key=433d2c486572afb242c6fe7c1ddc6771');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response = await client
        .send<TopRatedMovieResponse, TopRatedMovieResponse>($request);
    return $response.bodyOrThrow;
  }
}
