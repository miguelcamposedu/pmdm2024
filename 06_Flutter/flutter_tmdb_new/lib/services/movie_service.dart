import 'package:chopper/chopper.dart';
import 'package:flutter_tmdb_new/models/movie_videos_response/movie_videos_response.dart';
import 'package:flutter_tmdb_new/models/top_rated_movie_response/top_rated_movie_response.dart';

// this is necessary for the generated code to find your class
part 'movie_service.chopper.dart';

@ChopperApi(baseUrl: "/movie")
abstract class MovieService extends ChopperService {
  // helper methods that help you instantiate your service
  static MovieService create() {
    final client = ChopperClient(
      services: [_$MovieService()],
      converter: const JsonConverter(),
    );
    return _$MovieService(client);
  }

  @Get(path: '/popular?api_key=433d2c486572afb242c6fe7c1ddc6771')
  Future<TopRatedMovieResponse> getPopular();

  @Get(path: '/toprated?api_key=433d2c486572afb242c6fe7c1ddc6771')
  Future<TopRatedMovieResponse> getTopRated();
}
