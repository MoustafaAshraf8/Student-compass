import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'screen/Map_page/MapPage.dart';
import 'screen/Dropdown_page/DropdownPage.dart';
import '../screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const StartWidget());
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
      },
    );
  }
}
