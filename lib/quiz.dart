import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 1;

  void switchScreen() {
    setState(() {
      activeScreen++;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen++;
      });
    }
  }

  void restartQuiz() {
    activeScreen = 1;
    selectedAnswers = [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 79, 19, 145),
              Color.fromARGB(255, 97, 8, 147),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen == 1
              ? StartScreen(switchScreen)
              : (activeScreen == 2
                  ? QuestionsScreen(chooseAnswer)
                  : ResultScreen(restartQuiz,
                      selectedAnswers: selectedAnswers)),
        ),
      ),
    );
  }
}
