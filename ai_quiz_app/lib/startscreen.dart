import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.gotoQuestionScreen, {super.key});
  final Function() gotoQuestionScreen;
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Let's Practice AI concepts !",
          style: GoogleFonts.bungeeInline(
            color: const Color.fromARGB(255, 105, 167, 218),
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            'assets/image/AIHomeR.png',
            alignment: Alignment.center,
            width: 300,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        //filled tonal type button with icon is used for starting the quiz
        FilledButton.tonalIcon(
          onPressed: gotoQuestionScreen,
          icon: const Icon(Icons.navigate_next_outlined),
          style: FilledButton.styleFrom(
              backgroundColor: const Color.fromARGB(0, 0, 85, 130),
              shape: const StadiumBorder(
                side: BorderSide(style: BorderStyle.solid, width: 1.7),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
          label: Text(
            'Start Quiz',
            //google fonts is used in this project
            //visiting to website of google font and run installation command in
            //terminal to add in project and then just import google font library
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 161, 205, 223), fontSize: 20),
          ),
        )
      ],
    );
  }
}
