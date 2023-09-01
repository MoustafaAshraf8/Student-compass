import 'package:flutter/material.dart';

class FloatingBtn extends StatelessWidget {
  Function function;
  Icon icon;
  FloatingBtn({super.key, required this.function, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(14) // Background color
          ),
      onPressed: () {
        function();
      },
      child: icon,
    );
  }
}
