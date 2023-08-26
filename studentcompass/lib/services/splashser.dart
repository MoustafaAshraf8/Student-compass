import 'dart:async';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/signin.dart';

class Splashser {
  void islogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => signin())));
  }
}
