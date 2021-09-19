import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../data/questions.dart';
import '../widgets/answer_container.dart';
import '../widgets/button_question.dart';

class FirstQuestionPage extends StatefulWidget {
  const FirstQuestionPage({Key? key}) : super(key: key);

  @override
  State<FirstQuestionPage> createState() => _FirstQuestionPageState();
}

class _FirstQuestionPageState extends State<FirstQuestionPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
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
                const Text(
                  'Primeira Pergunta ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    itemBuilder: (context, index) => AnswerContainer(
                      index: index,
                      question: firstQuestion,
                    ),
                  ),
                ),
                const Align(
                  child: ButtonQuestion(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
