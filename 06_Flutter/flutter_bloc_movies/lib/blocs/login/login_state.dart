part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class DoLoginLoading extends LoginState {}

final class DoLoginSuccess extends LoginState {
  final LoginResponse userLogin;
  DoLoginSuccess(this.userLogin);
}

final class DoLoginError extends LoginState {
  final String errorMessage;
  DoLoginError(this.errorMessage);
}

final class GetRequestTokenSuccess extends LoginState {
  GetRequestTokenSuccess();
}

final class GetRequestTokenError extends LoginState {
  final String errorMessage;
  GetRequestTokenError(this.errorMessage);
}
