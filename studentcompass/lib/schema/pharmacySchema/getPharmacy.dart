import 'dart:convert';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';
import '../../screen/Map_page/map_classes.dart';

Future<List<Pharma>> getPharmacy() async {
  try {
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    final response = await dio.get('http://10.0.2.2:80/place/pharmacy');

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.data);
      List<Pharma> pharmacies = [];
      for (var p in jsonResponse) {
        Pharma pharma = Pharma(
          id: MarkerId((Random().nextInt(100).abs()).toString()),
          name: p['place_name'],
          description: "default description",
          seller: Seller(
              name: p['person_name'],
              email: p['person_email'],
              mobile: '0123456798'),
          longtitude: (p['place_longtitude']).toDouble(),
          latitude: (p['place_latitude']).toDouble(),
        );
        print(pharma.name);
        pharmacies.add(pharma);
      }
      return pharmacies;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to retrieve pharmacies.');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load pharmacies.');
  }
}
