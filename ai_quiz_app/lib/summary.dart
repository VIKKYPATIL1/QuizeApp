import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  //recieveing List of Map type function from result class
  const Summary({super.key, required this.getsummary});
  final List<Map<String, Object>> getsummary;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: SweepGradient(
            center: Alignment.bottomRight,
            startAngle: 0.1,
            endAngle: 0.2,
            colors: [
              Color.fromARGB(82, 1, 71, 133),
              Color.fromARGB(47, 10, 74, 111),
              Color.fromARGB(39, 8, 63, 111),
            ],
            tileMode: TileMode.clamp),
      ),
      height: 300,
      //to make content scrollable
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //spread operator to accessing getsummary method individual element interating manner
            ...getsummary.map(
              (data) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        //accesing question index type casting to int the adding 1
                        //to start index with 1 and type casting to string
                        ((data['question_index'] as int) + 1).toString(),
                        textAlign: TextAlign.center,

                        //ternary operation to check which is correct answer
                        style: GoogleFonts.lato(
                            color: data['user_answer'] == data['correct_answer']
                                ? const Color.fromARGB(255, 116, 223, 23)
                                : const Color.fromARGB(255, 247, 175, 175),
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //accesing question from Map below same
                              (data['question_text']).toString(),
                              style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 175, 231, 236),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              //accessing correct answer and iterating for all values below same
                              (data['correct_answer']).toString(),
                              style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 116, 223, 23),
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              //accessing Map values for user answer
                              (data['user_answer']).toString(),
                              style: GoogleFonts.lato(
                                  color: data['user_answer'] ==
                                          data['correct_answer']
                                      ? const Color.fromARGB(255, 116, 223, 23)
                                      : const Color.fromARGB(
                                          255, 247, 175, 175),
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
