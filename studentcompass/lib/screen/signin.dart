// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import './Dropdown_page/DropdownPage.dart';
import 'package:studentcompass/reusewidgets/reuse.dart';
import 'package:studentcompass/screen/signupppppp.dart';
import '../services/firebaseservices.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  Future<User>? _futureUser;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              const Text(
                "Login",
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              const Icon(
                Icons.login_outlined,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(
                height: 60,
              ),
              reusableTextField("Enter Email", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              // signInSignUpButton(context, true, () {
              //   _futureUser = createUser(
              //       _emailTextController.text, _passwordTextController.text);
              //   print(_futureUser);
              //   FirebaseAuth.instance
              //       .signInWithEmailAndPassword(
              //           email: _emailTextController.text,
              //           password: _passwordTextController.text)
              //       .then((value) {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const DropdownButtonApp()));
              //   });
              // }),
              ElevatedButton(
                onPressed: () {
                  print("-----------------");
                  setState(() {
                    _futureUser = createUser(_emailTextController.text,
                        _passwordTextController.text);
                    _futureUser!.then((value) => print(value.username));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DropdownPage()));
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[300]),
                child: const Text("Login"),
              ),
              signUpOption(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await FireBaseServices().signInWithGoogle();
                  if (context.mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DropdownPage()));
                  }
                },
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black26;
                  }
                  return Colors.white;
                })),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login with Gmail",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Facebook()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

Future<User> createUser(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:80/student/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(User);
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print("error");
      throw Exception('Failed to create album.');
    }
  } catch (e) {
    print(e);
  }
  return Future<User>.value(const User(username: 'NaN', password: 'NaN'));
}

class User {
  final String username;
  final String password;

  const User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['email'],
      password: json['password'],
    );
  }
}
