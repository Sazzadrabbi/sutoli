import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';

// Flushbar
void showFlushBar(BuildContext context, String msg) => Flushbar(
      icon: const Icon(
        Icons.sentiment_very_satisfied,
        size: 25,
        color: Colors.black,
      ),
      message: msg,
      messageColor: Colors.black,
      backgroundColor: Colors.greenAccent,
      duration: const Duration(milliseconds: 2500),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
    ).show(context);

void showErrorFlushBar(BuildContext context, String msg) => Flushbar(
      icon: const Icon(
        Icons.sentiment_dissatisfied,
        size: 25,
        color: Colors.black,
      ),
      message: msg,
      messageColor: Colors.black,
      backgroundColor: Colors.redAccent,
      duration: const Duration(milliseconds: 2500),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
    ).show(context);
