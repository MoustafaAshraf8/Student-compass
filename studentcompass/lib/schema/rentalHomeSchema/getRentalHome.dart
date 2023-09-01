import 'dart:convert';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
//import 'package:studentcompass/screen/Map_page/map_classes.dart';
import 'package:dio/dio.dart';
// import './RentalHome.dart';

import '../../screen/Map_page/map_classes.dart';

Future<List<RentalHome>> getRentalHome() async {
  try {
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    final response = await dio.get('http://10.0.2.2:80/place/rentalhome');

    // print(response.statusCode);
    // print(response.data);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.data);
      print(jsonResponse);
      List<RentalHome> rentalhomes = [];
      for (var home in jsonResponse) {
        RentalHome rentalhome = RentalHome(
          name: home['name'],
          id: MarkerId((Random().nextInt(100).abs()).toString()),
          description: "test description",
          seller: Seller(name: "name", email: "email", mobile: "mobile"),
          longtitude: (home['longtitude']).toDouble(),
          latitude: (home['latitude']).toDouble(),
          booked: home['available'],
        );

        rentalhomes.add(rentalhome);
      }
      print(rentalhomes);
      return rentalhomes;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.data);
      throw Exception('Failed to create user.');
    }
  } catch (e) {
    print("*****************");
    print(e);
    throw Exception('Failed to load homes');
  }
}
