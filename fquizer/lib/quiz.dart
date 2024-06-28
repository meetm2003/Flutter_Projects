import 'package:flutter/material.dart';
import 'package:fquizer/data/questions.dart';
import 'package:fquizer/front_page.dart';
import 'package:fquizer/questions_screen.dart';
import 'package:fquizer/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'front-page';
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   // this is function always execute before the build method of this class...
  //   activeScreen = FrontPage(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = FrontPage(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if(activeScreen == 'result-screen'){
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers,switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 248, 11, 90),
                Color.fromARGB(255, 254, 91, 145),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            // child: activeScreen,
            // child: activeScreen == 'front-page'
            //     ? FrontPage(switchScreen) // if true
            //     : const QuestionsScreen(), // if false
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
