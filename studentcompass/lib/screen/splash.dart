import 'package:flutter/material.dart';
import '/screen/signin.dart';
import '/services/splashser.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Splashser sp = Splashser();
  @override
  void initState() {
    super.initState();
    sp.islogin(context);
  }

  void gosign() async {
    await Future.delayed(const Duration(milliseconds: 1));
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Signin()),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset('assets/images/logo.jpeg', width: 200, height: 200),
            Text(
              "Loading...",
              style: TextStyle(color: Colors.black, fontSize: 60),
            )
          ],
        )));
  }
}
