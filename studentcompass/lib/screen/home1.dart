import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/drop_down.dart';
import '../services/firebaseservices.dart';
import 'SignIn_page/Signin.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
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
                const Spacer(),
                ElevatedButton(
                    child: const Icon(Icons.logout),
                    onPressed: () async {
                      await FireBaseServices().googleSignOut();
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signin()));
                      }
                    })
              ],
            )),
        backgroundColor: Colors.deepPurple,
        body: Center(
            child: ElevatedButton(
                child: const Text("choose your univ"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DropdownButtonApp()));
                })));
  }
}
