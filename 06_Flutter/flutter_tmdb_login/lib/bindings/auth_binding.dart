import 'package:flutter_tmdb_login/utils/api_client.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppChopperClient());
  }
}
