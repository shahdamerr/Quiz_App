import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, {super.key, required this.restart});

  final List<String> chosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'Question number:': i,
        'Question:': questions[i].question,
        'Correct answer:': questions[i].answers[0],
        'Your answer:': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final correct = getSummary().where((data) {
      return data['Your answer:'] == data['Correct answer:'];
    }).length;

    final total = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You answered $correct out of $total correctly',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              QuestionsSummary(getSummary()),
              TextButton.icon(
                  onPressed: restart,
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart quiz')),
            ],
          )),
    );
  }
}
