import 'dart:convert';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
//import 'package:studentcompass/screen/Map_page/map_classes.dart';
import 'package:dio/dio.dart';
// import './RentalHome.dart';

import '../../screen/Map_page/map_classes.dart';

Future<List<Pharma>> getPharmacy() async {
  try {
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    final response = await dio.get('http://10.0.2.2:80/place/pharmacy');

    // print(response.statusCode);
    // print(response.data);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.data);
      //print(jsonResponse);
      List<Pharma> pharmacies = [];
      for (var restaurant in jsonResponse) {
        Pharma pharma = Pharma(
          id: MarkerId((Random().nextInt(100).abs()).toString()),
          name: restaurant['place_name'],
          description: "default description",
          seller: Seller(
              name: restaurant['person_name'],
              email: restaurant['person_email'],
              mobile: '0123456798'),
          longtitude: (restaurant['place_longtitude']).toDouble(),
          latitude: (restaurant['place_latitude']).toDouble(),
        );

        pharmacies.add(pharma);
      }
      print(pharmacies);
      return pharmacies;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.data);
      throw Exception('Failed to retrieve pharmacies.');
    }
  } catch (e) {
    print("*****************");
    print(e);
    throw Exception('Failed to load pharmacies.');
  }
}
