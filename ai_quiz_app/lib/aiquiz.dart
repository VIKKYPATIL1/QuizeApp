import 'package:ai_quiz_app/data/question.dart';
import 'package:ai_quiz_app/resultscreen.dart';
import 'package:ai_quiz_app/startscreen.dart';
import 'package:flutter/material.dart';
import 'package:ai_quiz_app/questionscreen.dart';

class AiQuiz extends StatefulWidget {
  const AiQuiz({super.key});
  @override
  State<AiQuiz> createState() {
    return _AiQuizState();
  }
}

//this file is responsible for lifting different state and changing the current state
//using stateful widget we can render different ui component on same screen with changing current state
class _AiQuizState extends State<AiQuiz> {
  String currentState = 'Start Screen';
  //List type variable for storing user's selected answer
  List<String> choosenAnswer = [];

  //method for starting the quiz
  void gotoQuestionScreen() {
    setState(() {
      currentState = 'Question Screen';
    });
  }

  //method for selecting answers and storing to user's answer list
  //and checking all question are completed or not
  void selectAnswer(String anwer) {
    choosenAnswer.add(anwer);
    setState(() {
      if (question.length == choosenAnswer.length) {
        currentState = 'Result Screen';
      }
    });
  }

  //method for restarting the quiz
  void restart() {
    setState(() {
      currentState = 'Start Screen';
      //making list of user's anwer empty after every restart
      choosenAnswer = [];
    });
  }

  @override
  Widget build(context) {
    Widget activeState = StartScreen(gotoQuestionScreen);
    //checking the condition for which is current state after button are clicked
    //in differnt state
    if (currentState == 'Question Screen') {
      activeState = QuestionScreen(onChoose: selectAnswer);
    }
    if (currentState == 'Result Screen') {
      activeState = ResultScreen(choosenAnswer, restart: restart);
    }
    if (currentState == 'Start Screen') {
      activeState = StartScreen(gotoQuestionScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(166, 2, 96, 154),
            Color.fromARGB(255, 2, 87, 110),
            Color.fromARGB(255, 1, 40, 63),
          ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
          child: Center(
            child: activeState,
          ),
        ),
      ),
    );
  }
}
