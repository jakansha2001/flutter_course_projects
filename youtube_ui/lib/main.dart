import 'package:flutter/material.dart';
import 'package:youtube_ui/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomePage(),
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(color: Colors.black),
          scaffoldBackgroundColor: Colors.black),
    );
  }
}
