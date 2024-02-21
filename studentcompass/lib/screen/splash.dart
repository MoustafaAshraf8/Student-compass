import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentcompass/screen/Map_page/MapPage.dart';
import 'SignIn_page/Signin.dart';
import '/services/splashser.dart';
import '../screen/Dropdown_page/DropdownPage.dart';

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
    final prefs = await SharedPreferences.getInstance();
    () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Signin()));
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/logo.png'),
              height: 100,
              width: 140,
              fit: BoxFit.cover,
            ),
            SpinKitSpinningLines(color: Colors.purple[100]!)
          ],
        )));
  }
}
