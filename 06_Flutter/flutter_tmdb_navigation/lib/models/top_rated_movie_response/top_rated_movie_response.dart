import 'dart:convert';

import 'top_movie.dart';

class TopRatedMovieResponse {
  int? page;
  List<TopMovie>? results;
  int? totalPages;
  int? totalResults;

  TopRatedMovieResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TopRatedMovieResponse.fromMap(Map<String, dynamic> data) {
    return TopRatedMovieResponse(
      page: data['page'] as int?,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => TopMovie.fromMap(e as Map<String, dynamic>))
          .toList(),
      totalPages: data['total_pages'] as int?,
      totalResults: data['total_results'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'page': page,
        'results': results?.map((e) => e.toMap()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TopRatedMovieResponse].
  factory TopRatedMovieResponse.fromJson(String data) {
    return TopRatedMovieResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TopRatedMovieResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
