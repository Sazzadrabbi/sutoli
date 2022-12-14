import 'package:flutter/material.dart';
import 'package:sutoli/view/siginin_page.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, usersignin.routename);
        },
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
                      'Sign In',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.sell,
                size: 30.0,
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
