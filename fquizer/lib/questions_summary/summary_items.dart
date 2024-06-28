import 'package:flutter/material.dart';
import 'package:fquizer/questions_summary/question_indentifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItems extends StatelessWidget{
  const SummaryItems(this.itemData, {super.key});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIndentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(itemData['user_answer'] as String,
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 238, 127, 160),
                  ),
              ),
              Text(itemData['correct_answer'] as String,
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 163, 255, 154),
                  ),
              ),
            ],
        ))
      ],
    );
  }
}