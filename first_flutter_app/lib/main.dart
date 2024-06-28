import 'package:flutter/material.dart';
import 'package:first_flutter_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // body: GradientContainer.blackWhite(),
        body: GradientContainer(
          Color.fromARGB(255, 248, 11, 90),
          Color.fromARGB(255, 254, 91, 145)
        ),
      ),
    ),
  );
}


// List<Color> --->

//  body: GradientContainer(
//         color: [
//           Color.fromARGB(255, 248, 11, 90),
//           Color.fromARGB(221, 242, 54, 101)
//         ]),