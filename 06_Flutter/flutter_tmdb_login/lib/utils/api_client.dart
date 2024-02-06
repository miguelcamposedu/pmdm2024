import 'package:chopper/chopper.dart';
import 'package:flutter_tmdb_login/services/auth_service.dart';

class AppChopperClient {
  late ChopperClient _client;
  AppChopperClient() {
    createChopperClient();
  }

  T getChopperService<T extends ChopperService>() {
    return _client.getService<T>();
  }

  void createChopperClient() {
    _client = ChopperClient(
      baseUrl: Uri.parse("https://api.themoviedb.org/3"),
      services: [
        AuthService.create(),
      ],
      interceptors: [],
      converter: const JsonConverter(),
    );
  }
}
