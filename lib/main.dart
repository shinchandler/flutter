import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite Colour ?',
      'answers': [
        {'Text': 'Red', 'Score': 2},
        {'Text': 'Blue', 'Score': 10},
        {'Text': 'White', 'Score': 6},
        {'Text': 'Black', 'Score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favourite Animal ?',
      'answers': [
        {'Text': 'Lion', 'Score': 10},
        {'Text': 'Rabbit', 'Score': 8},
        {'Text': 'Snake', 'Score': 2},
        {'Text': 'Kitten', 'Score': 7}
      ]
    },
    {
      'questionText': 'What\'s your favourite Food ?',
      'answers': [
        {'Text': 'Pizza', 'Score': 10},
        {'Text': 'Litti-Chokha', 'Score': 8},
        {'Text': 'Salad', 'Score': 5},
        {'Text': 'Pork', 'Score': 4}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shinchandler\'s App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
