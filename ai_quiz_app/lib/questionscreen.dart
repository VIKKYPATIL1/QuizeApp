import 'package:ai_quiz_app/answerbutton.dart';
import 'package:flutter/material.dart';
import 'package:ai_quiz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onChoose(String answer)});
  final Function(String answer) onChoose;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

//this file is also a stateful widget because on every button clicked UI is updated
class _QuestionScreenState extends State<QuestionScreen> {
  //question index variable
  //and method for increamenting this varible to move forward
  int questionindex = 0;
  void questionIndexIncrement(String answer) {
    setState(() {
      //selected answer is added to user's answer list
      //widget is inbuilt keyword used in flutter to use differnt class variable
      //private class
      widget.onChoose(answer);
      questionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[questionindex];
    return Container(
      margin: const EdgeInsets.all(60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.lato(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          //spread operator used make single list where nested list is present
          //[1,2,[3,4,]] can be converted to [1,2,3,4]
          //map function used to map all list values and access their values
          ...currentQuestion.getShuffleAnswer().map((answer) => AnswerButton(
              answer: answer,
              ontap: () {
                questionIndexIncrement(answer);
              })),
        ],
      ),
    );
  }
}
