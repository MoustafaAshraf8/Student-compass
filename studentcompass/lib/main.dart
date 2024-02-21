import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/SignIn_page/signin.dart';
import 'home_page.dart';
import 'screen/Map_page/MapPage.dart';
import 'screen/Dropdown_page/DropdownPage.dart';
import '../screen/splash.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/map': (context) => const MapPage(),
        '/home_page': (context) => const MyHomePage(),
        '/dropDown': (context) => DropdownPage(),
        // edit in routes to add pages in the project
      },
    );
  }
}
