import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int number) {
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Expanded buildWidget({color = Color, int sound = 1}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          playSound(sound);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black45,
        body: SafeArea(
          child: Column(
            children: [
              buildWidget(color: Colors.red, sound: 1),
              buildWidget(color: Colors.orange, sound: 2),
              buildWidget(color: Colors.yellow, sound: 3),
              buildWidget(color: Colors.green, sound: 4),
              buildWidget(color: Colors.teal, sound: 5),
              buildWidget(color: Colors.blue, sound: 6),
              buildWidget(color: Colors.purple, sound: 7),
            ],
          ),
        ),
      ),
    );
  }
}
