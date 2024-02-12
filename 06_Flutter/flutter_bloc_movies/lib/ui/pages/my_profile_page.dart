import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movies/blocs/login/login_bloc.dart';
import 'package:flutter_bloc_movies/blocs/login/login_bloc.dart';
import 'package:flutter_bloc_movies/blocs/login/login_bloc.dart';
import 'package:flutter_bloc_movies/blocs/login/login_bloc.dart';
import 'package:flutter_bloc_movies/blocs/login/login_bloc.dart';
import 'package:flutter_bloc_movies/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc_movies/repositories/auth/auth_repository_impl.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  // Form
  final _formLogin = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  final passTextController = TextEditingController();

  late AuthRepository authRepository;
  late LoginBloc _loginBloc;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _loginBloc = LoginBloc(authRepository)..add(GetRequestTokenEvent());
    super.initState();
  }

  @override
  void dispose() {
    userTextController.dispose();
    passTextController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginBloc,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<LoginBloc, LoginState>(
          buildWhen: (context, state) {
            return state is LoginInitial ||
                state is DoLoginSuccess ||
                state is DoLoginError ||
                state is DoLoginLoading ||
                state is GetRequestTokenError;
          },
          builder: (context, state) {
            if (state is DoLoginSuccess) {
              return const Text('Login success');
            } else if (state is DoLoginError) {
              return const Text('Login error');
            } else if (state is DoLoginLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetRequestTokenError) {
              return ScaffoldMessenger(child: Text(state.errorMessage));
            }
            return Center(child: _buildLoginForm());
          },
          listenWhen: (context, state) {
            return state is GetRequestTokenSuccess;
          },
          listener: (BuildContext context, LoginState state) {},
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Form(
      key: _formLogin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Login',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: userTextController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passTextController,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Login'.toUpperCase()),
              onPressed: () {
                if (_formLogin.currentState!.validate()) {
                  _loginBloc.add(DoLoginEvent(
                      userTextController.text, passTextController.text));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
