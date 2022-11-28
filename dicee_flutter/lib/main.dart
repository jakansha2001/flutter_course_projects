import 'package:flutter/material.dart';
import 'dart:math';

import 'gen/assets.gen.dart';

void main() => runApp(const DicePage());

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Dicee',
              ),
            ),
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image.asset(
                      // Assets.images.dice4.path,
                      'images/dice$leftDiceNum.png',
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image.asset(
                      // Assets.images.dice4.path,
                      'images/dice$rightDiceNum.png',
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
