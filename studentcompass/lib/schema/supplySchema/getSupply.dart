import 'dart:convert';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';

import '../../screen/Map_page/map_classes.dart';

Future<List<Supply>> getSypply() async {
  try {
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    final response = await dio.get('http://10.0.2.2:80/place/supply');

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.data);
      List<Supply> supplies = [];
      for (var s in jsonResponse) {
        Supply supply = Supply(
          id: MarkerId((Random().nextInt(100).abs()).toString()),
          name: s['place_name'],
          description: "default description",
          seller: Seller(
              name: s['person_name'],
              email: s['person_email'],
              mobile: '0123456798'),
          longtitude: (s['place_longtitude']).toDouble(),
          latitude: (s['place_latitude']).toDouble(),
        );
        print(supply.name);
        supplies.add(supply);
      }
      return supplies;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.data);
      throw Exception('Failed to retrieve supplies.');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load supplies.');
  }
}
