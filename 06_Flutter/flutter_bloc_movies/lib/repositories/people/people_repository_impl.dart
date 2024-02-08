import 'dart:convert';

import 'package:flutter_bloc_movies/models/people_popular_response/people_popular_response.dart';
import 'package:flutter_bloc_movies/repositories/people/people_repository.dart';
import 'package:http/http.dart';

class PeopleRepositoryImpl extends PeopleRepository {
  Client _httpClient = Client();

  @override
  Future<People> fetchPeopleDetail(int peopleId) {
    throw UnimplementedError();
  }

  @override
  Future<List<People>> fetchPeoplePopular() async {
    final response = await _httpClient.get(Uri.parse(
        'https://api.themoviedb.org/3/people/popular?api_key=433d2c486572afb242c6fe7c1ddc6771'));
    if (response.statusCode == 200) {
      return PeoplePopularResponse.fromJson(json.decode(response.body))
          .results!;
    } else {
      throw Exception('Failed to load people');
    }
  }
}
