import 'package:flutter/material.dart';
import 'mapPage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MapPage(),
      // edit in routes to add pages in the project
      // !!!!!! don't make pages const !!!!!!!
    },
  ));
}
