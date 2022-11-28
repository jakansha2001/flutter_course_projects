import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int makeDecision = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Center(child: Text('Ask Me Anything')),
        backgroundColor: const Color.fromARGB(255, 0, 37, 100),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            setState(() {
              makeDecision = Random().nextInt(5) + 1;
            });
          },
          child: Image(
            image: AssetImage(
              'images/ball$makeDecision.png',
            ),
          ),
        ),
      ),
    );
  }
}
