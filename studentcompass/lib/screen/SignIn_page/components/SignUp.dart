// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:studentcompass/reusewidgets/ReuableButton.dart';
import 'package:studentcompass/screen/SignIn_page/signin.dart';

import '../../../reusewidgets/reuse.dart';
import '../../../schema/userSchema/User.dart';
import '../../../schema/userSchema/createUser.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  String u = "";
  Future<User>? _futureUser;

  void signUpUser() {
    setState(() {
      print(this._nameTextController.text);
      this._futureUser = createUser(
          name: this._nameTextController.text,
          email: this._emailTextController.text,
          password: this._passwordTextController.text);
    });
  }

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
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full name',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: reusableTextField(
                  "Name", Icons.email, false, _nameTextController),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: reusableTextField(
                  "Email", Icons.person_outline, false, _emailTextController),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: reusableTextField("Password", Icons.lock_outlined, true,
                  _passwordTextController),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ReusableButton(
                    context: context,
                    text: const Text("SIGN Up"),
                    isLogin: false,
                    onTap: this.signUpUser
                    //() async {
                    // await FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //         email: _emailTextController.text,
                    //         password: _passwordTextController.text)
                    //     .then((value) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const Signin()));
                    // });
                    // u = _nameTextController.text;
                    //}
                    )),
          ],
        ),
      ),
    );
  }
}
