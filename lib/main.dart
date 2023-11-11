import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'dart:math';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    bool endoftheQuiz = quizBrain.isFinished();

    setState(() {
      if (endoftheQuiz == true) {
        Alert(
                context: context,
                title: "FINISHED!",
                desc: "You've reached the end of the quiz.")
            .show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        }
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _showQueston(),
        _showOption('True', Colors.green, () {
          checkAnswer(true);
        }),
        _showOption('False', Colors.red, () {
          checkAnswer(false);
        }),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }

  Expanded _showOption(String text, Color color, Function onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          //textColor: Colors.white,
          color: color,
          child: TextButton(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              onPressed();
            },
          ),
        ),
      ),
    );
  }

  Expanded _showQueston() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            quizBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
