import 'package:chopper/chopper.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: '/authentication')
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client);

  @Get(path: '/token/new/')
  Future<Response> getRequestToken();
}
