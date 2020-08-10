import 'package:flutter/material.dart';
import 'package:flutter_crash/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _question = [
    {
      'questionText': 'What is your pets name?',
      'answer': [
        {'text': 'Elephant', 'score': 10},
        {'text': 'mouse', 'score': 5},
        {'text': 'horse', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your stret name?',
      'answer': [
        {'text': 'Russel', 'score': 10},
        {'text': 'The Strand', 'score': 5},
        {'text': 'Chappel', 'score': 1},
        {'text': 'moore', 'score': 0}
      ],
    },
    {
      'questionText': 'What is your teachers  name?',
      'answer': [
        {'text': 'ram', 'score': 10},
        {'text': 'Hari', 'score': 5},
        {'text': 'sita', 'score': 1},
        {'text': 'gopal', 'score': 0}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _countIndex(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
      //print(question[questionIndex]);
      //return questionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                countIndex: _countIndex,
                questionIndex: _questionIndex,
                question: _question)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
