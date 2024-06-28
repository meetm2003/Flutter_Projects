import 'package:flutter/material.dart';
import 'package:fquizer/data/questions.dart';
import 'package:fquizer/questions_summary/question_summary.dart';
import 'package:fquizer/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz,{super.key, required this.chosenAnswers});

  final void Function() restartQuiz;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
                'You Answered $numCorrectQuestions out of $numTotalQuestions Questions Correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: restartQuiz, 
              style:  
                ElevatedButton.styleFrom(
                  foregroundColor:const Color.fromARGB(255, 254, 91, 145),
                  textStyle: GoogleFonts.poppins(fontSize: 18),
                ),
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
