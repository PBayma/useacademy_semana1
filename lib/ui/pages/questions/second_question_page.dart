import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../data/questions.dart';
import '../../../model/answer.dart';
import '../../../model/question.dart';
import '../../../model/score.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_checkbox_container.dart';
import '../../widgets/custom_elevated_button.dart';

class SecondQuestionPage extends StatefulWidget {
  const SecondQuestionPage({Key? key}) : super(key: key);

  @override
  State<SecondQuestionPage> createState() => _SecondQuestionPageState();
}

class _SecondQuestionPageState extends State<SecondQuestionPage> {
  late bool answerSelected;
  late bool finishedQuestion;
  late Question question;
  late Score score;

  @override
  void initState() {
    question = secondQuestion;
    answerSelected = false;
    finishedQuestion = false;

    super.initState();
  }

  @override
  void dispose() {
    question = secondQuestion;
    answerSelected = false;
    finishedQuestion = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Score score = ModalRoute.of(context)!.settings.arguments as Score;

    return Scaffold(
      appBar: const CustomAppBar(),
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
                      height: 8,
                    ),
                    itemBuilder: (context, index) => CustomCheckboxContainer(
                      text: question.answers[index].answer,
                      resposta: finishedQuestion,
                      selecionado: question.answers[index].selected,
                      verdade: question.answers[index].flagRightAnswer,
                      onTap: () {
                        for (Answer answer in question.answers) {
                          if (answer.selected == true &&
                              answer.selected !=
                                  question.answers[index].selected) {
                            answer.selected = false;
                          }
                        }
                        setState(() {
                          if (question.answers[index].selected) {
                            question.answers[index].selected = false;
                            answerSelected = false;
                          } else {
                            question.answers[index].selected = true;
                            answerSelected = true;
                          }
                        });
                      },
                    ),
                  ),
                ),
                Align(
                    child: CustomElevetadButton(
                  finishedQuestion: finishedQuestion,
                  onPressed: !answerSelected
                      ? null
                      : !finishedQuestion
                          ? () {
                              List<Answer> selectedAnswer = question.answers
                                  .where((answer) => answer.selected == true)
                                  .toList();
                              if (selectedAnswer.isEmpty) {
                              } else {
                                int index =
                                    question.answers.indexOf(selectedAnswer[0]);
                                setState(() {
                                  finishedQuestion = true;
                                  if (question.indexCorrectAnswer == index) {
                                    question.answers[index].flagRightAnswer =
                                        true;
                                    score.rightAnswers += 1;
                                  } else {
                                    question
                                        .answers[question.indexCorrectAnswer]
                                        .flagRightAnswer = true;
                                    question
                                        .answers[question.indexCorrectAnswer]
                                        .selected = true;
                                    finishedQuestion = true;
                                  }
                                });
                              }
                            }
                          : () {
                              Navigator.pushNamed(context, '/third',
                                  arguments: score);
                            },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
