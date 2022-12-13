import 'package:flutter/material.dart';
import 'package:sutoli/view/splash_page.dart';
import 'package:sutoli/view/welcome_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashPage(),
      routes: {
        WelcomePage.routename: (context) => const WelcomePage(),
      },
    );
  }
}
