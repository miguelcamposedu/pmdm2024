import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tmdb_login/services/auth_service.dart';
import 'package:flutter_tmdb_login/utils/api_client.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


requestToken() async {
  final response = await Get.find<AppChopperClient>().getChopperService<AuthService>ChopperClient>();
if (response.isSuccessful) {
  final loginResponse = response.body;
  // do something with the posts...
} else {
  final loginError = response.error;
  // handle the error...
}
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
