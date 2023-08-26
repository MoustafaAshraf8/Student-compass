import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/map_page.dart';
import '/screen/signin.dart';
import '/screen/signup.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: [
              Text(
                u,
                style: const TextStyle(color: Colors.white),
              ),
              Spacer(),
              ElevatedButton(
                  child: const Icon(Icons.logout),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signin()));
                  })
            ],
          ),
        ),
        backgroundColor: Colors.deepPurple,
        body: Center(
            child: ElevatedButton(
                child: const Text("choose your univ"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapPage()));
                })));
  }
}
