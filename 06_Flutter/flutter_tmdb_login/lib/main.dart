import 'package:flutter/material.dart';
import 'package:flutter_tmdb_login/bindings/auth_binding.dart';
import 'package:flutter_tmdb_login/services/auth_service.dart';
import 'package:flutter_tmdb_login/ui/home_page.dart';
import 'package:flutter_tmdb_login/ui/login_page.dart';
import 'package:flutter_tmdb_login/utils/api_client.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: AuthBinding(),
        home: const LoginPage());
  }
}
