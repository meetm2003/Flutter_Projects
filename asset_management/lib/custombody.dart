import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  final Widget child;

  const CustomBody({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 205, 205, 205),
          ],
        ),
      ),
      child: child,
    );
  }
}
