import 'package:flutter/material.dart';
import 'package:sutoli/constant/regButton.dart';
import 'package:sutoli/constant/signinButton.dart';

class WelcomePage extends StatefulWidget {
  static const routename = 'WelcomePage';
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset(
                'assets/images/welcome.png',
                height: 320,
              ),
            ),
          ),
          const RegButton(),
          const SizedBox(
            height: 10.0,
          ),
          const SigninButton(),
        ],
      ),
    );
  }
}
