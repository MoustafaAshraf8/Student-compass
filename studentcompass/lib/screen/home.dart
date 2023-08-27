import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentcompass/screen/drop_down.dart';
import '/screen/signin.dart';
import '/screen/signup.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              const Spacer(),
              ElevatedButton(
                  child: const Icon(Icons.logout),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signin()));
                    }
                  })
            ],
          ),
        ),
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
