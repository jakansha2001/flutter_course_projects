import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I am Rich',
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: const Center(
            child: Text('I am Rich!'),
          ),
        ),
        body: const Center(
          child: Image(
            image: AssetImage('assets/diamond.png'),
          ),
        ),
      ),
    );
  }
}
