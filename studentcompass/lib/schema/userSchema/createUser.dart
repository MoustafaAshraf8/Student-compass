import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'package:dio/dio.dart';

Future<User> createUser(
    {required String name,
    required String email,
    required String password}) async {
  try {
    // Map<String, String> requestHeaders = {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    // };

    // print('##############');
    // final response = await http.post(
    //   Uri.parse('http://10.0.2.2:80/student/signup'),
    //   headers: requestHeaders,
    //   body: jsonEncode(
    //       <String, String>{"name": name, "email": email, "password": password}),
    // );

    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    final response = await dio.post('http://10.0.2.2:80/student/signup',
        data: {"name": name, "email": email, "password": password});

    //print(response.statusCode);

    print("--------------------------");
    print(response.data);
    print('--------------------------');
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      //var user = User.fromJson(jsonDecode(response.data));
      var jsonResponse = jsonDecode(response.data);
      List<User> users = [];
      for (var u in jsonResponse) {
        User user = User(
          id: u['person_id'],
          name: u['person_name'],
          email: u['person_email'],
        );
        users.add(user);
      }
      print(users);
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
