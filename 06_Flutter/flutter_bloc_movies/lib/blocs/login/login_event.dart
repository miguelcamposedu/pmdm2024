part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final String username;
  final String password;
  DoLoginEvent(this.username, this.password);
}

class GetRequestTokenEvent extends LoginEvent {}
