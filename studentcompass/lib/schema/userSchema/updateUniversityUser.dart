import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import 'package:dio/dio.dart';

Future<bool> updateUniversityUser({required int universityid}) async {
  try {
    const defaultToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTAsImlhdCI6MTY5MzY5ODUzNCwiZXhwIjoxNjkzNjk5MTM0fQ.GqpYwv8g0SzoJxzbG871Ciw6JHl48wmWIZFneh0lIbI';
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final dio = Dio();
    dio.options.responseType = ResponseType.plain;
    dio.options.headers["authorization"] = "bearer $defaultToken";
    final response = await dio.patch('http://10.0.2.2:80/student/university',
        data: {"universityid": universityid});

    if (response.statusCode == 200) {
      print(response.data);
      // var jsonResponse = jsonDecode(response.data);
      // List<User> users = [];
      // for (var u in jsonResponse) {
      //   User user = User(
      //     id: u['person_id'],
      //     name: u['person_name'],
      //     email: u['person_email'],
      //     accessToken: u['accessToken'],
      //   );
      //   print(user.name);
      //   users.add(user);
      // }
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('accessToken', users[0].accessToken);
      // return users[0];
      return true;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create user.');
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load user.');
  }
}
