import 'package:flutter/material.dart';

import 'price_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(primaryColor: Colors.lightBlue, scaffoldBackgroundColor: Colors.white),
      home: const PriceScreen(),
    );
  }
}
