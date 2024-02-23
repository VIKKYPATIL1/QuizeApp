class QuestionModel {
  //model for storing question string for every constructor call
  const QuestionModel(this.question, this.answer);
  //variable to store every question
  final String question;
  //variable to store mcq in list of type string
  final List<String> answer;

  //shuffling options in the list by copying option to another list and the shuffling the list items
  //oringinal list remain as it is
  //.shuffle is inbuilt method
  List<String> getShuffleAnswer() {
    List<String> shuffleAnswer = List.of(answer);
    shuffleAnswer.shuffle();
    return shuffleAnswer;
  }
}
