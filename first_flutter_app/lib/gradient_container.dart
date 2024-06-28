import 'package:first_flutter_app/dice_roller.dart';
import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colorTop, this.colorBottom, {super.key});

  final Color colorTop;
  final Color colorBottom;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorTop,
            colorBottom,
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(), 
      ),
    );
  }
}

// import 'package:first_flutter_app/styled_text.dart';
// class GradientContainer extends StatelessWidget {
//   const GradientContainer({required this.color,super.key});


  // const GradientContainer.blackWhite({super.key})
  //     : colorTop = const Color.fromARGB(255, 0, 0, 0),
  //       colorBottom = const Color.fromARGB(255, 253, 253, 253);

//   final List<Color> color;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: color,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText("Hello World..."),
//       ),
//     );
//   }
// }

