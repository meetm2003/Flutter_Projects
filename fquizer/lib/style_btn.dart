import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleBtn extends StatelessWidget {
  const StyleBtn({super.key, required this.ansText, required this.onTap});

  final String ansText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        foregroundColor: const Color.fromARGB(255, 254, 91, 145),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
        ),
      ),
      child: Text(
        ansText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
