import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.33,
        vertical: MediaQuery.of(context).size.height * 0.025,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Perguntas e respostas'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perguntas do quiz',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      'Responda 10 perguntas e veja sua pontuação final.'),
                ],
              ),
              ElevatedButton(
                child: const Text("Start!"),
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                },
                style: style,
              )
            ],
          ),
        ),
      ),
    );
  }
}
