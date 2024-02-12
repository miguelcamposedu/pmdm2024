import 'package:flutter_bloc_movies/models/dto/login_dto.dart';
import 'package:flutter_bloc_movies/models/response/login_response.dart';
import 'package:flutter_bloc_movies/models/response/request_token_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
  Future<RequestTokenResponse> getRequestToken();
}
