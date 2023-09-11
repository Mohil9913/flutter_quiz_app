class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    final duplicateList = List.of(answers);
    duplicateList.shuffle();
    return duplicateList;
  }
}
