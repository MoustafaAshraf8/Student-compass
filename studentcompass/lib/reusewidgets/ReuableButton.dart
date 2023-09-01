import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  Text text;
  BuildContext context;
  dynamic isLogin;
  Function onTap;
  ReusableButton(
      {super.key,
      required this.context,
      required this.text,
      required this.isLogin,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (isLogin is bool) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.black26;
                }
                return Colors.white;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
          child: Text(
            isLogin ? 'LOG IN' : 'SIGN UP',
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
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
      );
    }
  }
}
