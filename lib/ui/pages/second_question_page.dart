import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../data/questions.dart';
import '../../model/answer.dart';
import '../../model/question.dart';
import '../../model/score.dart';

class SecondQuestionPage extends StatefulWidget {
  const SecondQuestionPage({Key? key}) : super(key: key);

  @override
  State<SecondQuestionPage> createState() => _SecondQuestionPageState();
}

class _SecondQuestionPageState extends State<SecondQuestionPage> {
  @override
  Widget build(BuildContext context) {
    Score score = ModalRoute.of(context)!.settings.arguments as Score;
    Question question = secondQuestion;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color.fromRGBO(117, 140, 255, 1);
    }

    Color getColorRightAnswer(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return const Color.fromRGBO(56, 197, 61, 1);
    }

    Color getColorWrongAnswer(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return const Color.fromRGBO(255, 90, 90, 1);
    }

    final ButtonStyle styleButton = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.35,
        vertical: MediaQuery.of(context).size.height * 0.025,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    );
    final ButtonStyle styleButtonFinishedQuestion = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.28,
        vertical: MediaQuery.of(context).size.height * 0.025,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perguntas e respostas',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.question,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  'Respostas',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: firstQuestion.answers.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) => Container(
                      alignment: Alignment.topRight,
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: question.finishedQuestion == false
                          ? BoxDecoration(
                              color: question.answers[index].selected == false
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.background,
                              border: Border.all(
                                color: question.answers[index].selected == false
                                    ? const Color.fromRGBO(227, 227, 227, 1)
                                    : const Color.fromRGBO(117, 140, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            )
                          : question.answers[index].flagRightAnswer == false &&
                                  question.answers[index].flagWrongAnswer ==
                                      false
                              ? BoxDecoration(
                                  color:
                                      question.answers[index].selected == false
                                          ? Colors.white
                                          : Theme.of(context)
                                              .colorScheme
                                              .background,
                                  border: Border.all(
                                    color: question.answers[index].selected ==
                                            false
                                        ? const Color.fromRGBO(227, 227, 227, 1)
                                        : const Color.fromRGBO(
                                            117, 140, 255, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                )
                              : question.answers[index].flagWrongAnswer == false
                                  ? BoxDecoration(
                                      color: const Color.fromRGBO(
                                          229, 255, 230, 1),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              56, 197, 61, 1)),
                                      borderRadius: BorderRadius.circular(16),
                                    )
                                  : BoxDecoration(
                                      color: const Color.fromRGBO(
                                          255, 214, 214, 1),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              255, 90, 90, 1)),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: question.answers[index].selected,
                            onChanged: (value) {
                              for (Answer answer in question.answers) {
                                if (answer.selected == true &&
                                    answer.selected !=
                                        question.answers[index].selected) {
                                  answer.selected = false;
                                }
                              }
                              setState(() {
                                if (question.answers[index].selected == true) {
                                  question.answerSelected = false;
                                } else {
                                  question.answerSelected = true;
                                }
                                question.answers[index].selected = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            fillColor: question.finishedQuestion == false
                                ? MaterialStateProperty.resolveWith(getColor)
                                : question.answers[index].flagRightAnswer ==
                                            false &&
                                        question.answers[index]
                                                .flagWrongAnswer ==
                                            false
                                    ? MaterialStateProperty.resolveWith(
                                        getColor)
                                    : question.answers[index].flagWrongAnswer ==
                                            false
                                        ? MaterialStateProperty.resolveWith(
                                            getColorRightAnswer)
                                        : MaterialStateProperty.resolveWith(
                                            getColorWrongAnswer),
                            checkColor: Colors.white,
                          ),
                          Text(
                            question.answers[index].answer,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  child: ElevatedButton(
                      child: question.finishedQuestion == false
                          ? const Text('Responder')
                          : const Text(
                              'Proxima pergunta!',
                            ),
                      style: question.finishedQuestion == false
                          ? styleButton
                          : styleButtonFinishedQuestion,
                      onPressed: question.answerSelected == false
                          ? null
                          : question.finishedQuestion == false
                              ? () {
                                  List<Answer> selectedAnswer = question.answers
                                      .where(
                                          (answer) => answer.selected == true)
                                      .toList();
                                  if (selectedAnswer.isEmpty) {
                                  } else {
                                    int index = question.answers
                                        .indexOf(selectedAnswer[0]);
                                    setState(() {
                                      question.finishedQuestion = true;
                                      if (question.indexCorrectAnswer ==
                                          index) {
                                        question.answers[index]
                                            .flagRightAnswer = true;

                                        score.rightAnswers += 1;
                                      } else {
                                        question
                                            .answers[
                                                question.indexCorrectAnswer]
                                            .flagRightAnswer = true;
                                        question
                                            .answers[
                                                question.indexCorrectAnswer]
                                            .selected = true;
                                        question.answers[index]
                                            .flagWrongAnswer = true;
                                      }
                                    });
                                  }
                                }
                              : () {
                                  Navigator.pushNamed(context, '/third',
                                      arguments: score);
                                }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}