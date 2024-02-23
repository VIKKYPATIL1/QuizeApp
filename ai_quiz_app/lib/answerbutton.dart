import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.ontap});
  final String answer;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(0, 255, 193, 7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
          ),
          child: Text(
            answer,
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 211, 236, 234), fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
