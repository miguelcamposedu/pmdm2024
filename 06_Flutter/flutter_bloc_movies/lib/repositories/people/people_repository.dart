import 'package:flutter_bloc_movies/models/response/people_popular_response.dart';

abstract class PeopleRepository {
  Future<List<People>> fetchPeoplePopular();
  Future<People> fetchPeopleDetail(int peopleId);
}
