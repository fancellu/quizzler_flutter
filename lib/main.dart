import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void checkFor(bool b) {
    setState(() {
      quizBrain.checkFor(b);
    });
  }

  Widget promptWidget() {
    if (quizBrain.finished) {
      return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          setState(() {
            quizBrain.reset();
          });
        },
        child: const Text(
          'Finished, try again?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      );
    } else {
      return Center(
        child: Text(
          quizBrain.prompt(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: promptWidget(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
//                quizBrain.questions[quizBrain.questionNumber].questionAnswer =
                true;
                checkFor(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                checkFor(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            //The user picked false.
          ),
        ),
        Row(
          children: quizBrain.scoreKeeper,
        )
      ],
    );
  }
}
