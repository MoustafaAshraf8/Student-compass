import 'dart:convert';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';
import '../../screen/Map_page/map_classes.dart';

Future<List<Resto>> getRestaurant() async {
  try {
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    final response = await dio.get('http://10.0.2.2:80/place/restaurant');

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.data);
      List<Resto> restaurants = [];
      for (var restaurant in jsonResponse) {
        Resto resto = Resto(
          id: MarkerId((Random().nextInt(100).abs()).toString()),
          name: restaurant['place_name'],
          description: restaurant['restaurant_description'],
          seller: Seller(
              name: restaurant['person_name'],
              email: restaurant['person_email'],
              mobile: '0123456798'),
          longtitude: (restaurant['place_longtitude']).toDouble(),
          latitude: (restaurant['place_latitude']).toDouble(),
        );
        print(resto.name);
        restaurants.add(resto);
      }
      print(restaurants);
      return restaurants;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.data);
      throw Exception('Failed to retrieve restaurants.');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load restaurants');
  }
}
