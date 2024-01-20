import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ...summaryData.map((data) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(((data['Question number:'] as int) + 1).toString() + ") ",
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((data['Question:'] as String),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Your answer:' + '${data['Your answer:']}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    Text('Correct answer: ' + '${data['Correct answer:']}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                ),
              )
            ]);
          }).toList(),
        ]),
      ),
    );
  }
}
