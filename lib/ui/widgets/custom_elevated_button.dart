import 'package:flutter/material.dart';

class CustomElevetadButton extends StatelessWidget {
  final bool finishedQuestion;
  final Function()? onPressed;
  const CustomElevetadButton({
    Key? key,
    this.onPressed,
    required this.finishedQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return ElevatedButton(
      child: !finishedQuestion
          ? const Text('Responder')
          : const Text(
              'Proxima pergunta!',
            ),
      style:
          finishedQuestion == false ? styleButton : styleButtonFinishedQuestion,
      onPressed: onPressed,
    );
  }
}
