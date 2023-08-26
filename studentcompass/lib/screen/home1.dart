import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/map_page.dart';
import '../services/firebaseservices.dart';
import '/screen/signin.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Row(
              children: [
                Text(
                  "${FirebaseAuth.instance.currentUser!.displayName}",
                  style: const TextStyle(color: Colors.white),
                ),
                Spacer(),
                ElevatedButton(
                    child: const Icon(Icons.logout),
                    onPressed: () async {
                      await firebaseservices().googleSignOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signin()));
                    })
              ],
            )),
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
