import 'package:flutter/material.dart';
import 'package:fquizer/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontPage extends StatelessWidget {
  const FrontPage(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 250,
          color: const Color.fromARGB(150, 255, 255, 255), // to make traperent image
        ),

        const SizedBox(
          height: 80,
        ),

        const StyledText("Learn Flutter the fun way!"),
        
        const SizedBox(
          height: 30,
        ),

        ElevatedButton.icon(
          onPressed: startQuiz, 
          style:  
            ElevatedButton.styleFrom(
              foregroundColor:const Color.fromARGB(255, 254, 91, 145),
              textStyle: GoogleFonts.poppins(fontSize: 18),
            ),
          icon: const Icon(Icons.arrow_forward),
          label: const Text("Start Quiz"),
        ),
      ],
    );
  }
}
