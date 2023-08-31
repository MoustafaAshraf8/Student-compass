// ignore_for_file: prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/signin.dart';

import '../reusewidgets/reuse.dart';

class Facebook extends StatefulWidget {
  const Facebook({super.key});

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  String u = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 15,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Please create account',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: reusableTextField("Enter FullName", Icons.person_outline,
                  false, _userNameTextController),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: reusableTextField("Enter UserName", Icons.person_outline,
                  false, _userNameTextController),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: reusableTextField("Enter Email Id", Icons.person_outline,
                  false, _emailTextController),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: reusableTextField("Enter Password", Icons.lock_outlined,
                  true, _passwordTextController),
            ),
            Container(
                height: 70,
                width: 50,
                // color: Colors.amber,
                padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                child: signInSignUpButton(context, false, () async {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signin()));
                  });
                  u = _userNameTextController.text;
                })),
          ],
        ),
      ),
    );
  }
}
