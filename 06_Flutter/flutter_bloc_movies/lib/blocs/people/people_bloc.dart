import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_movies/models/people_popular_response/people_popular_response.dart';
import 'package:flutter_bloc_movies/repositories/people/people_repository.dart';
import 'package:meta/meta.dart';

part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  final PeopleRepository peopleRepository;

  PeopleBloc(this.peopleRepository) : super(PeopleInitial()) {
    on<PeopleFetchPopular>(_onPeopleFetchPopular);
  }

  void _onPeopleFetchPopular(
      PeopleFetchPopular event, Emitter<PeopleState> emit) async {
    try {
      final peopleList = await peopleRepository.fetchPeoplePopular();
      emit(PeopleFetchSuccess(peopleList));
      return;
    } on Exception catch (e) {
      emit(PeopleFetchError(e.toString()));
    }
  }
}
