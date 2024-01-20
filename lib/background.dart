import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          color: const Color.fromARGB(163, 255, 255, 255),
        ),
        const SizedBox(height: 50),
        Text('Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 29,
            )),
        const SizedBox(height: 50),
        OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_forward_rounded),
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    ));
  }
}
