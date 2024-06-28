import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
      
      // const TextStyle(color: Colors.white, fontSize: 23),
      textAlign: TextAlign.center,
    );
  }
}
