import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/SignIn_page/signin.dart';
import 'package:studentcompass/screen/splash.dart';
import 'home_page.dart';
import 'screen/Map_page/MapPage.dart';
import './screen/drop_down.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StartWidget());
}

class StartWidget extends StatelessWidget {
  const StartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/drop_down',
      routes: {
        '/signin': (context) => const Signin(),
        '/map': (context) => const MapPage(),
        '/home_page': (context) => const MyHomePage(),
        '/drop_down': (context) => const DropdownButtonExample(),
        // edit in routes to add pages in the project
      },
    );
  }
}
