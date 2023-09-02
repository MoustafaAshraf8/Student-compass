import 'dart:convert';
import 'package:dio/dio.dart';
import 'University.dart';

Future<List<University>> getUniversity() async {
  try {
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    final response = await dio.get('http://10.0.2.2:80/place/university');

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.data);
      List<University> universities = [];
      for (var u in jsonResponse) {
        University university = University(
          id: u['university_id'],
          name: u['university_name'],
          longtitude: (u['university_longtitude']).toDouble(),
          latitude: (u['university_latitude']).toDouble(),
        );
        print(university.name);
        universities.add(university);
      }
      return universities;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to retrieve universities.');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load universities.');
  }
}
