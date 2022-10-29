import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Card Application',
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/64529996?v=4'),
            ),
          ],
        ),
      ),
    );
  }
}
