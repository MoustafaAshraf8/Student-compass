import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import 'package:dio/dio.dart';

Future<User> signinUser(
    {required String email, required String password}) async {
  try {
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    final response = await dio.post('http://10.0.2.2:80/student/signin',
        data: {"email": email, "password": password});
    print('#######################');
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.data);
      print(jsonResponse);
      List<User> users = [];
      for (var u in jsonResponse) {
        User user = User(
          id: u['person_id'],
          name: u['person_name'],
          email: u['person_email'],
          accessToken: u['accessToken'],
        );
        users.add(user);
      }
      print(users[0].accessToken);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', users[0].accessToken);
      print('#######################');
      return users[0];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.data);
      throw Exception('Failed to create user.');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load user.');
  }
}
