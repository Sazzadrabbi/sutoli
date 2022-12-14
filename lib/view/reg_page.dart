import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sutoli/constant/flushbar.dart';
import 'package:sutoli/view/siginin_page.dart';
import 'package:sutoli/viewmodel/auth/AuthService.dart';

class userregistration extends StatefulWidget {
  static const String routename = 'Regpage';
  const userregistration({super.key});

  @override
  State<userregistration> createState() => _userregistrationState();
}

class _userregistrationState extends State<userregistration> {
  bool _isobsecure = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errMsg = '';
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/auth.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    'Already a member?',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, usersignin.routename);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z.]')),
                  FilteringTextInputFormatter.deny(RegExp('0-9')),
                ],
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Name',
                  icon: Icon(Icons.person),
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
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
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
                controller: _addressController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Address',
                  icon: Icon(Icons.location_on_rounded),
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
                maxLength: 11,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: _passwordController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Number',
                  icon: Icon(Icons.call),
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
                maxLength: 8,
                controller: _phoneController,
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
                child: InkWell(
                  onTap: _userreg,
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
                                'Authenticate',
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
              Text(
                _errMsg,
                style: const TextStyle(color: Colors.blueAccent),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _userreg() async {
    try {
      final uid = await AuthService.signUpUser(
        _nameController.text,
        _emailController.text.toLowerCase(),
        _addressController.text,
        _phoneController.text,
        _passwordController.text,
      );
      if (uid != null) {
        Navigator.pushNamed(context, usersignin.routename);
      }
    } on FirebaseAuthException catch (error) {
      setState(() {
        showErrorFlushBar(context, error.message!);
      });
    }
  }
}
