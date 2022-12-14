import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutoli/constant/flushbar.dart';
import 'package:sutoli/view/home_page.dart';
import 'package:sutoli/view/welcome_page.dart';
import 'package:sutoli/viewmodel/auth/AuthService.dart';
import 'package:sutoli/viewmodel/provider/userprovider.dart';

class usersignin extends StatefulWidget {
  static const String routename = 'usersignin';
  const usersignin({super.key});

  @override
  State<usersignin> createState() => _usersigninState();
}

class _usersigninState extends State<usersignin> {
  bool _isobsecure = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errMsg = '';
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, WelcomePage.routename);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Image.asset('assets/images/auth.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    'New to this app?',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, userregistration.routenames);
                    },
                    child: const Text(
                      'Register Yourself',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Email',
                  icon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordController,
                obscureText: _isobsecure,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  icon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isobsecure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isobsecure = !_isobsecure;
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: _signInUser,
                  child: Container(
                    width: 320.0,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0.0, 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50.0,
                          width: 220.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 12.0),
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22.0),
                                topLeft: Radius.circular(22.0),
                                bottomRight: Radius.circular(200.0)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Sign In...',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_sharp,
                          size: 30.0,
                          color: Colors.blueAccent,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _errMsg,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInUser() async {
    try {
      final uid = await AuthService.signInUser(
          _emailController.text.toLowerCase(), _passwordController.text);
      if (uid != null) {
        // ignore: use_build_context_synchronously
        final isUser = await Provider.of<UserProvider>(context, listen: false)
            .isBuyer(AuthService.currentUser!.email!);
        if (isUser) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushNamedAndRemoveUntil(
              HomePage.routename, (Route<dynamic> route) => false);
        } else {
          setState(() {
            _errMsg = "Sorry you are not a user";
            AuthService.signOut();
          });
        }
      }
    } on FirebaseAuthException catch (error) {
      setState(() {
        showErrorFlushBar(context, error.message!);
      });
    }
  }
}
