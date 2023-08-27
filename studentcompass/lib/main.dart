import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/splash.dart';
import 'map_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/map': (context) => MapPage(),
      // edit in routes to add pages in the project
      // !!!!!! don't make pages const !!!!!!!
    },
  ));
}
