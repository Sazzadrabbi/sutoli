import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutoli/view/home_page.dart';
import 'package:sutoli/view/reg_page.dart';
import 'package:sutoli/view/siginin_page.dart';
import 'package:sutoli/view/splash_page.dart';
import 'package:sutoli/view/welcome_page.dart';
import 'package:sutoli/viewmodel/provider/userprovider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const SplashPage(),
          routes: {
            WelcomePage.routename: (context) => const WelcomePage(),
            userregistration.routename: (context) => const userregistration(),
            usersignin.routename: (context) => const usersignin(),
            HomePage.routename: (context) => const HomePage(),
          },
        ));
  }
}
