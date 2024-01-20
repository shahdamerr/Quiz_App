class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    //shuffles the list but the "of "method
    //uses a copy of the list not the original
    final List<String> shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
