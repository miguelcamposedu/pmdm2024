import 'dart:convert';

import 'movie_trailer.dart';

class MovieVideosResponse {
  int? id;
  List<MovieTrailer>? results;

  MovieVideosResponse({this.id, this.results});

  factory MovieVideosResponse.fromMap(Map<String, dynamic> data) {
    return MovieVideosResponse(
      id: data['id'] as int?,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => MovieTrailer.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MovieVideosResponse].
  factory MovieVideosResponse.fromJson(String data) {
    return MovieVideosResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MovieVideosResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
