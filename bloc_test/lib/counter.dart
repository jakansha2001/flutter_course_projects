import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counterValue = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          Future.delayed(Duration(seconds: 3));
          setState(() {
            counterValue = counterValue++;
            isLoading = false;
          });
        },
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : counterValue < 0
                ? Text('negative')
                : Text(counterValue.toString()),
      ),
    );
  }
}
