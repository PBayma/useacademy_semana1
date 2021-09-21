import '../model/answer.dart';

import '../model/question.dart';

final firstQuestion = Question(
  question: 'Qual o nome completo do Pedro?',
  answers: [
    Answer(
        answer: 'Pedro Oliveira Bayma',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: 'Pedro Bayma',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: 'Pedro Bayma da Silva',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: 'Pedro Candido Bayma',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false)
  ],
  indexCorrectAnswer: 0,
  finishedQuestion: false,
  answerSelected: false,
);

final secondQuestion = Question(
  question: 'Qual o nome do primeiro cachorro dele?',
  answers: [
    Answer(
        answer: 'Rex',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: 'Fox',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: 'Mel',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: 'Pretinho',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
  ],
  indexCorrectAnswer: 2,
  finishedQuestion: false,
  answerSelected: false,
);

final thirdQuestion = Question(
  question: 'Qual sua altura?',
  answers: [
    Answer(
        answer: '1.80',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: '1.83',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: '1.78',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false),
    Answer(
        answer: '1.86',
        selected: false,
        flagWrongAnswer: false,
        flagRightAnswer: false)
  ],
  indexCorrectAnswer: 3,
  finishedQuestion: false,
  answerSelected: false,
);
