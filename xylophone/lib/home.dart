import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void playSound(int x) {
    final player = AudioPlayer();
    player.play(AssetSource('assets_note$x.wav'));
  }

  Widget buildKey({required Color color, required int soundNum}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playSound(soundNum);
        },
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red, soundNum: 1),
            buildKey(color: Colors.orange, soundNum: 2),
            buildKey(color: Colors.yellow, soundNum: 3),
            buildKey(color: Colors.green, soundNum: 4),
            buildKey(color: Colors.teal, soundNum: 5),
            buildKey(color: Colors.blue, soundNum: 6),
            buildKey(color: Colors.purple, soundNum: 7),
          ],
        ));
  }
}
