import 'package:ai_quiz_app/summary.dart';
import 'package:flutter/material.dart';
import 'package:ai_quiz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswer, {super.key, required this.restart});
  final List<String> choosenAnswer;
  final Function() restart;
  //creating a method to display the last summary of quiz
  //using for loop iterating each value and adding to list type map
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < question.length; i++) {
      summary.add({
        'question_index': i,
        'question_text': question[i].question,
        'correct_answer': question[i].answer[0],
        'user_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    //storing function to the variable
    final getsummary = getSummary();
    final int totalQuestion = question.length;
    //method to check how many answer's are correctly given
    final int correctAnsweredQuestion = getsummary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You Answer $correctAnsweredQuestion out $totalQuestion of correctly ',
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 224, 169, 201),
              fontSize: 28,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 50,
        ),
        //passing getsummary function to Summary class for displaying the summary data
        Summary(getsummary: getsummary),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(onPressed: restart, child: const Text('Restart'))
      ],
    );
  }
}
