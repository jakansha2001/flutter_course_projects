import 'dart:io';

import 'package:flutter/material.dart';

import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    bool isLastQuestion = quizBrain.isLastQuestion();

    if (!isLastQuestion) {
      if (userPickedAnswer == correctAnswer) {
        quizBrain.setScore();
        setState(() {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        });
      } else {
        setState(() {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        });
      }

      setState(() {
        quizBrain.nextQuestion();
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'You have ended the quiz. Thanks!',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Your final score is: ${quizBrain.getScore()}'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        quizBrain.resetQ();
                        scoreKeeper.clear();
                      });
                    },
                    child: const Text('Restart'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      exit(1);
                    },
                    child: const Text('Exit'),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  // List<bool> answers = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
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
                  checkAnswer(true);
                },
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
