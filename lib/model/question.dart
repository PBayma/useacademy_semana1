import 'answer.dart';

class Question {
  final String question;
  final List<Answer> answers;
  final int indexCorrectAnswer;
  bool answerSelected;
  bool finishedQuestion;

  Question({
    required this.question,
    required this.answers,
    required this.indexCorrectAnswer,
    required this.answerSelected,
    required this.finishedQuestion,
  });
}
