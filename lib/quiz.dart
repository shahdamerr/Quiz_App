import 'package:flutter/material.dart';
import 'package:quiz_app/background.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/questionScreen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    // called  only once
    //and is used generally for initializing the previously defined variables of the stateful widget
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      //runs build method again to switch states
      activeScreen = QuestionScreen(addAnswer);
    });
  }

  void restart() {
    setState(() {
      //runs build method again to switch states
      selectedAnswers = [];
      activeScreen = QuestionScreen(addAnswer);
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //runs build method again to switch states

        activeScreen = ResultScreen(
          selectedAnswers,
          restart: restart,
        );
        //selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 151, 30, 202),
            ),
            child: activeScreen),
      ),
    );
  }
}
