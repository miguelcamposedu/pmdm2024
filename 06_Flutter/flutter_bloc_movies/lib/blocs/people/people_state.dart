part of 'people_bloc.dart';

@immutable
sealed class PeopleState {}

final class PeopleInitial extends PeopleState {}

final class PeopleFetchSuccess extends PeopleState {
  final List<People> peopleList;
  PeopleFetchSuccess(this.peopleList);
}

final class PeopleFetchError extends PeopleState {
  final String errorMessage;
  PeopleFetchError(this.errorMessage);
}
