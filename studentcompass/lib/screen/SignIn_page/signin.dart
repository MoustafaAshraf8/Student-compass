// ignore_for_file: prefer_final_fields

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/SignIn_page/components/SignInOptions.dart';
import '../Dropdown_page/DropdownPage.dart';
import '../../services/firebaseservices.dart';

import '../../reusewidgets/ReuableButton.dart';
import '../../reusewidgets/ReusableTextField.dart';

import 'dart:async';

import '../../schema/userSchema/User.dart';
import '../../schema/userSchema/signinUser.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  User _futureUser = User(id: 0, name: "", email: "", accessToken: "");
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  void regesterUser() async {
    _futureUser = await signinUser(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DropdownPage()));
    });
  }

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
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: const Icon(
                  Icons.login_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(
              //   height: 60,
              // ),
              // reusableTextField("Enter Email", Icons.person_outline, false,
              //     _emailTextController),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: ReusableTextField(
                    text: "Email",
                    icon: Icons.mail,
                    isPasswordType: false,
                    controller: _emailTextController),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // reusableTextField("Enter Password", Icons.lock_outline, true,
              //     _passwordTextController),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ReusableTextField(
                    text: "Password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: _passwordTextController),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
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
              ReusableButton(
                  context: context,
                  text: Text("LOG IN"),
                  isLogin: true,
                  onTap: () {
                    // _futureUser = createUser(_emailTextController.text,
                    //     _passwordTextController.text);
                    // print(_futureUser);
                    // FirebaseAuth.instance
                    //     .signInWithEmailAndPassword(
                    //         email: _emailTextController.text,
                    //         password: _passwordTextController.text)
                    //     .then((value) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const DropdownButtonApp()));
                    // });
                    regesterUser();
                  }),
              SignInOptions(),
              const SizedBox(
                height: 20,
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     await FireBaseServices().signInWithGoogle();
              //     if (context.mounted) {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const DropdownButtonApp()));
              //     }
              //   },
              //   style: ButtonStyle(backgroundColor:
              //       MaterialStateProperty.resolveWith((states) {
              //     if (states.contains(MaterialState.pressed)) {
              //       return Colors.black26;
              //     }
              //     return Colors.white;
              //   })),
              //   child: const Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           "Login with Gmail",
              //           style: TextStyle(
              //               fontSize: 24,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black87),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              ReusableButton(
                context: context,
                text: Text("Login with Google"),
                isLogin: null,
                onTap: () async {
                  await FireBaseServices().signInWithGoogle();
                  if (context.mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DropdownPage()));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
