import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.black, body: DrumPage()),
    );
  }
}

class DrumPage extends StatelessWidget {
  void sesiCal(String ses) {
    final player = AudioPlayer();
    player.play(AssetSource('$ses.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad("bongo", Colors.blue),
                  ),
                  Expanded(
                    child: buildDrumPad("bip", Colors.pink),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad("clap1", Colors.red),
                  ),
                  Expanded(
                    child: buildDrumPad("clap2", Colors.yellow),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad("clap3", Colors.grey),
                  ),
                  Expanded(
                    child: buildDrumPad("crash", Colors.green),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad("how", Colors.orange),
                  ),
                  Expanded(
                    child: buildDrumPad("woo", Colors.brown),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildDrumPad(String ses, Color renk) {
    return TextButton(
      onPressed: () {
        sesiCal("$ses");
      },
      child: Container(
        color: renk,
      ),
    );
  }
}
