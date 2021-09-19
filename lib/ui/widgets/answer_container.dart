import 'package:flutter/material.dart';
import '../../model/answer.dart';
import '../../model/question.dart';

class AnswerContainer extends StatefulWidget {
  final Question question;
  final int index;
  const AnswerContainer({Key? key, required this.index, required this.question})
      : super(key: key);

  @override
  State<AnswerContainer> createState() => _AnswerContainerState();
}

class _AnswerContainerState extends State<AnswerContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Question question = widget.question;

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

    return Container(
      alignment: Alignment.topRight,
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
        color: question.answers[widget.index].selected == false
            ? Colors.white
            : Theme.of(context).colorScheme.background,
        border: Border.all(
          color: question.answers[widget.index].selected == false
              ? const Color.fromRGBO(227, 227, 227, 1)
              : const Color.fromRGBO(117, 140, 255, 1),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Checkbox(
            value: question.answers[widget.index].selected,
            onChanged: (value) {
              for (Answer answer in question.answers) {
                if (answer.selected == true &&
                    answer.selected !=
                        question.answers[widget.index].selected) {
                  answer.selected = false;
                }
              }
              setState(() {
                question.answers[widget.index].selected = value!;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            fillColor: MaterialStateProperty.resolveWith(getColor),
            checkColor: Colors.white,
          ),
          Text(
            question.answers[widget.index].answer,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
