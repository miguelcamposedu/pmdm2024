import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const styleWhiteBold = TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        decoration: TextDecoration.underline);

    const defaultText = TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        decoration: TextDecoration.underline);

    return Scaffold(
        body: Container(
      width: double.infinity,
      color: const Color(0xFFE62F16),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: Image.asset('assets/img/path_logo.png')),
                    const Text('Beautiful, Private sharing')
                  ])),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                      child: const Text('Sign Up'), onPressed: () {}),
                  const Text('Already have a Path account?'),
                  OutlinedButton(
                    child: const Text('Log In'),
                    onPressed: () {},
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'Terms of Use',
                      style: styleWhiteBold,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            )),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: styleWhiteBold,
                        ),
                      ],
                    ),
                  )
                ]),
              ))
        ],
      ),
    ));
  }
}
