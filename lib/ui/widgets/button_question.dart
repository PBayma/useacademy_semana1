import 'package:flutter/material.dart';

class ButtonQuestion extends StatelessWidget {
  const ButtonQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.35,
        vertical: MediaQuery.of(context).size.height * 0.025,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    );

    return ElevatedButton(
      onPressed: () {},
      child: const Text('Responder'),
      style: style,
    );
  }
}
