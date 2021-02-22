import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Widget buildKey({int note, Color keyColor}) => Expanded(
        child: FlatButton(
          onPressed: () {
            playSound(note);
          },
          color: keyColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(note: 1, keyColor: Colors.red),
              buildKey(note: 2, keyColor: Colors.orange),
              buildKey(note: 3, keyColor: Colors.yellow),
              buildKey(note: 4, keyColor: Colors.green),
              buildKey(note: 5, keyColor: Colors.teal),
              buildKey(note: 6, keyColor: Colors.blue),
              buildKey(note: 7, keyColor: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
