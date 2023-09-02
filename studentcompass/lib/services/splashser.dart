import 'dart:async';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/SignIn_page/Signin.dart';

class Splashser {
  void islogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Signin())));
  }
}
