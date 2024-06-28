class QuizQuestions{
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getSuffledAnswer(){
    final shuffledList = List.of(answers); // .of() function is used to create copy list based on existing list...
    shuffledList.shuffle();
    return shuffledList;
  }
}