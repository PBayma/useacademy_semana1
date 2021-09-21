import 'package:flutter/material.dart';

import 'ui/pages/pages.dart';
import 'ui/pages/result/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color.fromRGBO(117, 140, 255, 1),
          background: const Color.fromRGBO(229, 233, 255, 1),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/first': (context) => const FirstQuestionPage(),
        '/second': (context) => const SecondQuestionPage(),
        '/third': (context) => const ThirdQuestionPage(),
        '/last': (context) => const ResultPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
