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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Xylophone'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('assets_note1.wav'));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(''),
            )
          ],
        ));
  }
}
